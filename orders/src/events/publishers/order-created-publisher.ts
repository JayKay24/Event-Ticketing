import { Publisher, OrderCreatedEvent, Subjects } from "@jkntickets/common";

export class OrderCreatedPublisher extends Publisher<OrderCreatedEvent> {
  subject: Subjects.OrderCreated = Subjects.OrderCreated;
}
