import nats from "node-nats-streaming";

const sc = nats.connect("ticketing", "abc", { url: "http://localhost:4222" });

sc.on("connect", () => {
  console.log("Publisher connected to NATS");
});
