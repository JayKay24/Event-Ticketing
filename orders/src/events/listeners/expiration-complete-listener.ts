import { Message } from "node-nats-streaming";
import {
  Listener,
  ExpirationCompleteEvent,
  Subjects,
  OrderStatus,
} from "@jkntickets/common";

import { OrderCancelledPublisher } from "../publishers/order-cancelled-publisher";
import { Order } from "../../models/order";
import { queueGroupName } from "./queue-group-name";
import { natsWrapper } from "../../nats-wrapper";

export class ExpirationCompleteListener extends Listener<ExpirationCompleteEvent> {
  subject: Subjects.ExpirationComplete = Subjects.ExpirationComplete;

  queueGroupName = queueGroupName;

  async onMessage(data: ExpirationCompleteEvent["data"], msg: Message) {
    const order = await Order.findById(data.orderId);

    if (!order) {
      throw new Error("Order not found");
    }

    order.set({ status: OrderStatus.Cancelled });

    await order.save();

    await order.populate("ticket").execPopulate();

    await new OrderCancelledPublisher(natsWrapper.client).publish({
      id: order.id,
      version: order.version,
      ticket: {
        id: order.ticket.id,
      },
    });

    msg.ack();
  }
}
