import CableReady from "cable_ready"
import consumer from "./consumer"

consumer.subscriptions.create("DashboardChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Se ha creado la subscription al canal")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Se ha desconectado del canal")
  },

  received(data) {
    console.log("estos son los datos que llegaron", data)
    if(data.cableReady) { CableReady.perform(data.operations) }
  }
});
