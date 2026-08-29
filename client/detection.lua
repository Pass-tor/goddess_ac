GAC.ClientDetection = {}

function GAC.ClientDetection.Report(detectionName, severity, confidence, evidence)
    TriggerServerEvent('goddess_ac:server:reportDetection', detectionName, severity, confidence, evidence)
end
