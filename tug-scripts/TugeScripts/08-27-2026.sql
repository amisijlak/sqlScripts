SELECT name FROM sys.tables;


select * from CollectionAgentBrokenPTPTasks
CollectionCenterNotificationTasks
delete from collection_center.CollectionCenterDashboardCacheTrackers where reportDate > '2026-08-20'

delete from collection_center.CollectionCenterDashboardCacheTrackers where reportDate > '2026-08-20'


select * from dwh.BIToolCollectionAgentDataDatasets where createdOn >'2026-08-20'

delete from dwh.BIToolCollectionAgentDataDatasets where createOn >'2026-08-20'

--{"t":"CRMDwhConnector.BLL.TasksMs.ITaskBasedJobsService, CRMDwhConnector.BLL","m":"CreateClientsPendingImpoundingTasksAsync"}'

BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		SET XACT_ABORT ON
		DECLARE @queue VARCHAR(20) = 'default'
		DECLARE @culture VARCHAR(20) = '"en-US"'
		DECLARE @uiCulture VARCHAR(20) = '"en-US"'
		-- You can InvocationData and Arguments from some completed job in DB
		DECLARE @invocationData VARCHAR(MAX) = '{"t":"CRMDataLoader.BLL.BITools.IBIToolCollectionAgentDatasetService, CRMDataLoader.BLL","m":"QueueNewSyncOperationAsync"}'
		DECLARE @arguments VARCHAR(MAX) = '[]'
		DECLARE @currentTime DATETIME = GETUTCDATE()
		IF (SELECT Version FROM HangFire.[Schema]) <> 7
		BEGIN
			PRINT 'Invalid HangFire schema, please review the script'
			SET NOEXEC ON
		END
		DECLARE @jobId TABLE (ID INT)
		INSERT INTO HangFire.Job (StateId,StateName,InvocationData,Arguments,CreatedAt,ExpireAt)
		OUTPUT inserted.Id INTO @jobId VALUES (NULL,'Enqueued',@invocationData,@arguments,@currentTime,NULL)
		DECLARE @unixTimeSeconds VARCHAR(20) = CAST(DATEDIFF(SECOND, {d '1970-01-01'}, GETUTCDATE()) AS VARCHAR(20))
		DECLARE @stateId TABLE (ID INT)
		INSERT INTO HangFire.State (JobId,Name,Reason,CreatedAt,Data) OUTPUT inserted.Id INTO @stateId
		VALUES ((SELECT Id FROM @jobId),'Enqueued','Added via SQL script',@currentTime,CONCAT('{"EnqueuedAt":"', @unixTimeSeconds, '000","Queue":"', @queue, '"}'))
		UPDATE HangFire.Job SET StateId = (SELECT Id FROM @stateId) WHERE Id = (SELECT Id FROM @jobId)
		INSERT INTO HangFire.JobParameter(JobId,Name,Value)
		VALUES ((SELECT Id FROM @jobId),'CurrentCulture',@culture), ((SELECT Id FROM @jobId),'CurrentUICulture',@uiCulture), ((SELECT Id FROM @jobId),'Time',@unixTimeSeconds)
		INSERT INTO HangFire.JobQueue(JobId,Queue) VALUES((SELECT Id FROM @jobId),@queue)
		SET NOEXEC OFF
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK;
		THROW;
	END CATCH
END


update workflows.WorkflowData set KycCheckPassed=1,CurrentStepData='Passed' where PhoneNumber = ('256707407827') and CurrentStepId=5;
update workflows.WorkflowData set KycCheckPassed=1,CurrentStepData='Passed' where 
PhoneNumber IN ('256759669819','256759171176','256701643006','256700643534',
'256760549285','256744638227','256765056737','256769281151','256730918350')
 and CurrentStepId=5;

 INSERT INTO opportunities.LeaseCompletionRequests(OpportunityId,LeaseStatus, CompletionDate,CreatedOn, Status) VALUES(134943,4,'2026-09-10',GETDATE(), 0)
 INSERT INTO opportunities.LeaseCompletionRequests(OpportunityId,LeaseStatus, CompletionDate,CreatedOn, Status) VALUES(135045,4,'2026-09-10',GETDATE(), 0)
 
select * from opportunities.LeaseCompletionRequests where OpportunityId=134943
select * from kyc.AccountKYCFields where accountId =500050
select * from kyc.AccountKYCFields where accountId =292589
select * from kyc.cacheEntries where id =669


select * from kyc.AccountKYCFields where accountId =292589