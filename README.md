/**
 @mainpage
  The WorkerThreadPool (WTP) is a library that allows implementors to define Work Items that get run concurrently by a fixed set of threads.

  Current status: Experimental

  Callers add WTP::WorkItem objects to queues which are maintained internally by the WTP. When a worker thread is free, it looks in its list of queues, selects one, removes the next WorkItem from the queue, and invokes WorkItem's run() method. Every WorkerThreadPool comes with exactly one "concurrent" queue. WorkItem objects added to this queue may execute concurrently. Callers can create additional queues, but all additional queues are "sequential", meaning the next WorkItem does not get executed till the current one has completed.

  WorkItems can create SubItems, which execute concurrently. The parent WorkItem waits till all SubItems are complete.

  To use the WTP, implementors need to:
 - Instantiate a WTP::WorkerThreadPool object.
 - [optional] Instantiate a WTP::Freelist and populate with pre-allocated
   WTP::WorkItem objects.
 - Start all threads using the WTP::WorkerThreadPool::startThreads() function.
 - [optional] Add one or more sequential queues.
 - Instantiate a WorkItem and add to a queue. Repeat as needed.
 - [optional] Spawn SubItems from within WorkItems in a sequential queue.
 - When done, call waitEmpty().
 - Call shutDown() to shut down the threads.
 - Deallocate WorkerThreadPool object.
 - If using freelists, deallocate them.

  The code is extensively documented in Doxygen format, and all efforts are made to keep the comments coherent and in sync with the code. Inaccurate or missing documentation should be reported as bugs.

*/
