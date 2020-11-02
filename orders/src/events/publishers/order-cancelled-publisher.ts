import { Publisher, OrderCancelled, Subjects } from "@jkntickets/common";

export class OrderCancelledPublisher extends Publisher<OrderCancelled> {
  subject: Subjects.OrderCancelled = Subjects.OrderCancelled;
}
