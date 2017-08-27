trigger Contact on Contact (after insert) {
	System.enqueueJob(new SecondQueueableJob(trigger.new[0].Id));
}