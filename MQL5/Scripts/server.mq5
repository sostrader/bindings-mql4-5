//+------------------------------------------------------------------+
//|                                                       server.mq5 |
//|                                          Copyright 2017, Hitback |
//|                                                 mauro@hitback.us |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, Hitback"
#property link      "mauro@hitback.us"
#property version   "1.00"
#property strict
#include <Zmq/Zmq.mqh>

void OnStart()
  {
// Prepare our context and socket
   Context context;
   Socket socket(context,ZMQ_REQ);

   Print("Connecting to hello world server…");
   socket.connect("tcp://localhost:5555");

// Do 10 requests, waiting each time for a response
   for(int request_nbr=0; request_nbr!=10; request_nbr++)
     {
      ZmqMsg request("PORRA");
      PrintFormat("Client Sending Hello %d...",request_nbr);
      socket.send(request);

      // Get the reply.
      ZmqMsg reply;
      socket.recv(reply);
      PrintFormat("Client Received World %d",request_nbr);
     }
  }
//+------------------------------------------------------------------+