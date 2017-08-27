trigger Account on Account (after update) {
	System.enqueueJob(new FirstQueueableJob(trigger.new[0].Id));
}