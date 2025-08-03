Started by user Ray Chenley

Obtained Jenkinsfile from git https://github.com/Appigle/ray-8945274-cicd-s25-a3
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins
in /Users/raychen/.jenkins/workspace/ray-8945274-cicd-s25-a3
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
Selected Git installation does not exist. Using Default
The recommended git tool is: NONE
using credential 44b3f32f-d85e-4e24-925f-c46d25cacd1c
Cloning the remote Git repository
Cloning repository https://github.com/Appigle/ray-8945274-cicd-s25-a3

> git init /Users/raychen/.jenkins/workspace/ray-8945274-cicd-s25-a3 # timeout=10
> Fetching upstream changes from https://github.com/Appigle/ray-8945274-cicd-s25-a3
> git --version # timeout=10
> git --version # 'git version 2.39.5 (Apple Git-154)'
> using GIT_ASKPASS to set credentials My GitHub PAT
> git fetch --tags --force --progress -- https://github.com/Appigle/ray-8945274-cicd-s25-a3 +refs/heads/_:refs/remotes/origin/_ # timeout=10
> git config remote.origin.url https://github.com/Appigle/ray-8945274-cicd-s25-a3 # timeout=10
> git config --add remote.origin.fetch +refs/heads/_:refs/remotes/origin/_ # timeout=10
> Avoid second fetch
> git rev-parse refs/remotes/origin/main^{commit} # timeout=10
> Checking out Revision 774242f92f7396df2a917e2ed927f2f600ad3f28 (refs/remotes/origin/main)
> git config core.sparsecheckout # timeout=10
> git checkout -f 774242f92f7396df2a917e2ed927f2f600ad3f28 # timeout=10
> Commit message: "feat: re-arrange the file structure"
> git rev-list --no-walk 1a146130c25fe2bc2686dac224da677e959b2789 # timeout=10
> [Pipeline] }
> [Pipeline] // stage
> [Pipeline] withEnv
> [Pipeline] {
> [Pipeline] withEnv
> [Pipeline] {
> [Pipeline] stage
> [Pipeline] { (Checkout)
> [Pipeline] echo
> Checking out code from GitHub...
> [Pipeline] checkout
> Selected Git installation does not exist. Using Default
> The recommended git tool is: NONE
> using credential 44b3f32f-d85e-4e24-925f-c46d25cacd1c
> git rev-parse --resolve-git-dir /Users/raychen/.jenkins/workspace/ray-8945274-cicd-s25-a3/.git # timeout=10
> Fetching changes from the remote Git repository
> git config remote.origin.url https://github.com/Appigle/ray-8945274-cicd-s25-a3 # timeout=10
> Fetching upstream changes from https://github.com/Appigle/ray-8945274-cicd-s25-a3
> git --version # timeout=10
> git --version # 'git version 2.39.5 (Apple Git-154)'
> using GIT_ASKPASS to set credentials My GitHub PAT
> git fetch --tags --force --progress -- https://github.com/Appigle/ray-8945274-cicd-s25-a3 +refs/heads/_:refs/remotes/origin/_ # timeout=10
> git rev-parse refs/remotes/origin/main^{commit} # timeout=10
> Checking out Revision 774242f92f7396df2a917e2ed927f2f600ad3f28 (refs/remotes/origin/main)
> git config core.sparsecheckout # timeout=10
> git checkout -f 774242f92f7396df2a917e2ed927f2f600ad3f28 # timeout=10
> Commit message: "feat: re-arrange the file structure"
> [Pipeline] }
> [Pipeline] // stage
> [Pipeline] stage
> [Pipeline] { (Build)
> [Pipeline] script
> [Pipeline] {
> [Pipeline] echo
> Building the application...
> [Pipeline] sh

- npm install
  npm warn deprecated inflight@1.0.6: This module is not supported, and leaks memory. Do not use it. Check out lru-cache if you want a good and tested way to coalesce async requests by a key value, which is much more comprehensive and powerful.
  npm warn deprecated supertest@6.3.4: Please upgrade to supertest v7.1.3+, see release notes at https://github.com/forwardemail/supertest/releases/tag/v7.1.3 - maintenance is supported by Forward Email @ https://forwardemail.net
  npm warn deprecated glob@7.2.3: Glob versions prior to v9 are no longer supported
  npm warn deprecated superagent@8.1.2: Please upgrade to superagent v10.2.2+, see release notes at https://github.com/forwardemail/superagent/releases/tag/v10.2.2 - maintenance is supported by Forward Email @ https://forwardemail.net

added 344 packages, and audited 345 packages in 1m

51 packages are looking for funding
run `npm fund` for details

found 0 vulnerabilities
[Pipeline] echo
Build completed successfully
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Test)
[Pipeline] script
[Pipeline] {
[Pipeline] echo
Running tests...
[Pipeline] sh

- npm test

> cicd-azure-functions@1.0.0 test
> jest

PASS tests/HttpTrigger.test.js
Azure Function HttpTrigger Tests
✓ should return 200 status code (1 ms)
✓ should return "Hello, World!" message (1 ms)
✓ should return correct content type header

Test Suites: 1 passed, 1 total
Tests: 3 passed, 3 total
Snapshots: 0 total
Time: 0.155 s
Ran all test suites.
[Pipeline] }
[Pipeline] // script
Post stage
Error when executing always post condition:
java.lang.NoSuchMethodError: No such DSL method 'publishTestResults' found among steps [archive, bat, build, catchError, checkout, deleteDir, dir, echo, emailext, emailextrecipients, envVarsForTool, error, fileExists, findBuildScans, getContext, git, input, isUnix, junit, library, libraryResource, load, mail, milestone, node, parallel, powershell, properties, publishChecks, publishHTML, pwd, pwsh, readFile, readTrusted, resolveScm, retry, script, setGitHubPullRequestStatus, sh, sleep, stage, stash, step, timeout, timestamps, tm, tool, unarchive, unstable, unstash, validateDeclarativePipeline, waitForBuild, waitUntil, warnError, withChecks, withContext, withCredentials, withEnv, withGradle, wrap, writeFile, ws] or symbols [GitUsernamePassword, Number, Open, agent, all, allBranchesSame, allOf, allowRunOnStatus, always, ant, antFromApache, antOutcome, antTarget, any, anyOf, apiToken, apiTokenProperty, architecture, archiveArtifacts, artifactManager, asIsGITScm, assembla, authorInChangelog, authorizationMatrix, azureCLI, azureServicePrincipal, batchFile, bitbucket, bitbucketBranchDiscovery, bitbucketBuildStatusNotifications, bitbucketDiscardOldBranch, bitbucketDiscardOldTag, bitbucketForkDiscovery, bitbucketPRTargetBranchRefSpec, bitbucketPublicRepoPullRequestFilter, bitbucketPullRequestDiscovery, bitbucketServer, bitbucketSshCheckout, bitbucketTagDiscovery, bitbucketTrustEveryone, bitbucketTrustNobody, bitbucketTrustProject, bitbucketTrustTeam, bitbucketWebhookConfiguration, bitbucketWebhookRegistration, booleanParam, branch, branchCreated, branches, brokenBuildSuspects, brokenTestsSuspects, browser, buildButton, buildDiscarder, buildDiscarders, buildRetention, buildSingleRevisionOnly, buildUser, buildingTag, builtInNode, caseInsensitive, caseSensitive, certificate, cgit, changeRequest, changelog, changelogBase, changelogToBranch, changeset, checkoutOption, checkoutToSubdirectory, choice, choiceParam, cleanAfterCheckout, cleanBeforeCheckout, cleanWs, clock, cloneOption, close, command, commentPattern, commit, commitChanged, commitMessagePattern, computerRetentionCheckInterval, consoleUrlProvider, contributor, cps, created, credentials, cron, crumb, culprits, dark, darkSystem, default, defaultDisplayUrlProvider, defaultFolderConfiguration, defaultView, deleted, demand, description, developers, disableConcurrentBuilds, disableRestartFromStage, disableResume, discoverOtherRefs, discoverOtherRefsTrait, diskSpace, diskSpaceMonitor, downstream, dumb, durabilityHint, email-ext, envVars, envVarsFilter, environment, equals, experimentalFlags, expression, extendedEmailPublisher, file, fileParam, filePath, fingerprint, fingerprints, firstBuildChangelog, fisheye, frameOptions, freeStyle, freeStyleJob, fromScm, fromSource, git, gitBranchDiscovery, gitHooks, gitHub, gitHubBranchDiscovery, gitHubBranchHeadAuthority, gitHubEvents, gitHubExcludeArchivedRepositories, gitHubExcludeForkedRepositories, gitHubExcludePrivateRepositories, gitHubExcludePublicRepositories, gitHubForkDiscovery, gitHubIgnoreDraftPullRequestFilter, gitHubPRStatus, gitHubPlugin, gitHubPullRequestDiscovery, gitHubSshCheckout, gitHubTagDiscovery, gitHubTopicsFilter, gitHubTrustContributors, gitHubTrustEveryone, gitHubTrustNobody, gitHubTrustPermissions, gitLab, gitList, gitSCM, gitTagDiscovery, gitTool, gitUsernamePassword, gitWeb, gitblit, github, githubBranches, githubPRAddLabels, githubPRClosePublisher, githubPRComment, githubPRMessage, githubPRRemoveLabels, githubPRStatusPublisher, githubPlugin, githubProjectProperty, githubPullRequests, githubPush, gitiles, gogs, gradle, group, hashChanged, headRegexFilter, headWildcardFilter, hyperlink, hyperlinkToModels, ignoreOnPush, inbound, inheriting, inheritingGlobal, installSource, isRestartedRun, jdk, jdkInstaller, jgit, jgitapache, jnlp, jobBuildDiscarder, jobName, junitTestResultStorage, kiln, label, labels, labelsAdded, labelsExist, labelsNotExist, labelsPatternExists, labelsRemoved, lastDuration, lastFailure, lastGrantedAuthorities, lastStable, lastSuccess, legacy, legacySCM, lfs, list, local, localBranch, localBranchTrait, location, logRotator, loggedInUsersCanDoAnything, mailer, masterBuild, maven, maven3Mojos, mavenErrors, mavenGlobalConfig, mavenMojos, mavenWarnings, message, modernSCM, multiBranchProjectDisplayNaming, multibranch, myView, namedBranchesDifferent, noGITScm, node, nodeProperties, nonInheriting, nonMergeable, none, nonresumable, not, organizationFolder, overrideIndexTriggers, paneStatus, parallelsAlwaysFailFast, parameters, password, pattern, perBuildTag, permanent, phabricator, pipeline, pipelineGraphView, pipelineTriggers, plainText, plugin, pollSCM, preserveStashes, previous, projectNamingStrategy, proxy, pruneStaleBranch, pruneStaleTag, pruneTags, pullRequest, pullRequests, queueItemAuthenticator, quietPeriod, rateLimit, rateLimitBuilds, recipients, redmine, refSpecs, remoteName, requestor, resourceRoot, responseTime, restriction, restrictions, retainOnlyVariables, rhodeCode, run, runParam, sSHLauncher, schedule, scmGit, scmRetryCount, scriptApproval, scriptApprovalLink, search, security, shell, showBitbucketAvatar, simpleBuildDiscarder, skipDefaultCheckout, skipStagesAfterUnstable, slave, sourceRegexFilter, sourceWildcardFilter, sparseCheckout, sparseCheckoutPaths, ssh, sshPublicKey, sshUserPrivateKey, standard, status, statusOnPublisherError, string, stringParam, submodule, submoduleOption, suppressAutomaticTriggering, suppressFolderAutomaticTriggering, swapSpace, tag, tags, teamFoundation, teamSlugFilter, text, textParam, themeManager, timestamper, timestamperConfig, timezone, tmpSpace, toolLocation, triggeredBy, unsecured, untrusted, upstream, upstreamDevelopers, user, userIdentity, userOrGroup, userSeed, usernameColonPassword, usernamePassword, viewgit, viewsTabBar, weather, withAnt, zip] or globals [currentBuild, env, params, pipeline, scm]
at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.DSL.invokeMethod(DSL.java:219)
at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsScript.invokeMethod(CpsScript.java:124)
at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:103)
at java.base/java.lang.reflect.Method.invoke(Method.java:580)
at org.codehaus.groovy.reflection.CachedMethod.invoke(CachedMethod.java:98)
at groovy.lang.MetaMethod.doMethodInvoke(MetaMethod.java:325)
at groovy.lang.MetaClassImpl.invokeMethod(MetaClassImpl.java:1225)
at groovy.lang.MetaClassImpl.invokeMethod(MetaClassImpl.java:1034)
at org.codehaus.groovy.runtime.callsite.PogoMetaClassSite.call(PogoMetaClassSite.java:41)
at org.codehaus.groovy.runtime.callsite.CallSiteArray.defaultCall(CallSiteArray.java:47)
at org.codehaus.groovy.runtime.callsite.AbstractCallSite.call(AbstractCallSite.java:116)
at PluginClassLoader for script-security//org.kohsuke.groovy.sandbox.impl.Checker$1.call(Checker.java:180)
	at PluginClassLoader for script-security//org.kohsuke.groovy.sandbox.GroovyInterceptor.onMethodCall(GroovyInterceptor.java:23)
	at PluginClassLoader for script-security//org.jenkinsci.plugins.scriptsecurity.sandbox.groovy.SandboxInterceptor.onMethodCall(SandboxInterceptor.java:163)
	at PluginClassLoader for script-security//org.kohsuke.groovy.sandbox.impl.Checker$1.call(Checker.java:178)
	at PluginClassLoader for script-security//org.kohsuke.groovy.sandbox.impl.Checker.checkedCall(Checker.java:182)
	at PluginClassLoader for script-security//org.kohsuke.groovy.sandbox.impl.Checker.checkedCall(Checker.java:152)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.sandbox.SandboxInvoker.methodCall(SandboxInvoker.java:17)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.LoggingInvoker.methodCall(LoggingInvoker.java:118)
	at WorkflowScript.run(WorkflowScript:38)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.delegateAndExecute(ModelInterpreter.groovy:139)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.runPostConditions(ModelInterpreter.groovy:728)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.catchRequiredContextForNode(ModelInterpreter.groovy:390)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.runPostConditions(ModelInterpreter.groovy:727)
	at com.cloudbees.groovy.cps.CpsDefaultGroovyMethods.each(CpsDefaultGroovyMethods:2125)
	at com.cloudbees.groovy.cps.CpsDefaultGroovyMethods.each(CpsDefaultGroovyMethods:2110)
	at com.cloudbees.groovy.cps.CpsDefaultGroovyMethods.each(CpsDefaultGroovyMethods:2151)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.runPostConditions(ModelInterpreter.groovy:717)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.executeSingleStage(ModelInterpreter.groovy:644)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:292)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.toolsBlock(ModelInterpreter.groovy:521)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:280)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.withEnvBlock(ModelInterpreter.groovy:432)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:279)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.withCredentialsBlock(ModelInterpreter.groovy:464)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:278)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.inDeclarativeAgent(ModelInterpreter.groovy:561)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:276)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.stageInput(ModelInterpreter.groovy:354)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:265)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.inWrappers(ModelInterpreter.groovy:592)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:263)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.withEnvBlock(ModelInterpreter.groovy:432)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:258)
	at ___cps.transform___(Native Method)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.ContinuationGroup.methodCall(ContinuationGroup.java:90)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.FunctionCallBlock$ContinuationImpl.dispatchOrArg(FunctionCallBlock.java:114)
at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.FunctionCallBlock$ContinuationImpl.fixArg(FunctionCallBlock.java:83)
	at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:103)
	at java.base/java.lang.reflect.Method.invoke(Method.java:580)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.ContinuationPtr$ContinuationImpl.receive(ContinuationPtr.java:72)
at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.CollectionLiteralBlock$ContinuationImpl.dispatch(CollectionLiteralBlock.java:55)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.CollectionLiteralBlock$ContinuationImpl.item(CollectionLiteralBlock.java:45)
at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:103)
at java.base/java.lang.reflect.Method.invoke(Method.java:580)
at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.ContinuationPtr$ContinuationImpl.receive(ContinuationPtr.java:72)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.ConstantBlock.eval(ConstantBlock.java:21)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.Next.step(Next.java:83)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.Continuable.run0(Continuable.java:147)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.SandboxContinuable.access$001(SandboxContinuable.java:17)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.SandboxContinuable.run0(SandboxContinuable.java:49)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsThread.runNextChunk(CpsThread.java:180)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsThreadGroup.run(CpsThreadGroup.java:419)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsThreadGroup$2.call(CpsThreadGroup.java:327)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsThreadGroup$2.call(CpsThreadGroup.java:292)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsVmExecutorService.lambda$wrap$4(CpsVmExecutorService.java:140)
	at java.base/java.util.concurrent.FutureTask.run(FutureTask.java:317)
	at hudson.remoting.SingleLaneExecutorService$1.run(SingleLaneExecutorService.java:139)
	at jenkins.util.ContextResettingExecutorService$1.run(ContextResettingExecutorService.java:28)
	at jenkins.security.ImpersonatingExecutorService$1.run(ImpersonatingExecutorService.java:68)
	at jenkins.util.ErrorLoggingExecutorService.lambda$wrap$0(ErrorLoggingExecutorService.java:51)
	at java.base/java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:572)
at java.base/java.util.concurrent.FutureTask.run(FutureTask.java:317)
at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1144)
at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:642)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsVmExecutorService$1.call(CpsVmExecutorService.java:53)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsVmExecutorService$1.call(CpsVmExecutorService.java:50)
	at org.codehaus.groovy.runtime.GroovyCategorySupport$ThreadCategoryInfo.use(GroovyCategorySupport.java:136)
at org.codehaus.groovy.runtime.GroovyCategorySupport.use(GroovyCategorySupport.java:275)
at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsVmExecutorService.lambda$categoryThreadFactory$0(CpsVmExecutorService.java:50)
at java.base/java.lang.Thread.run(Thread.java:1583)

[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deploy)
Stage "Deploy" skipped due to earlier failure(s)
[Pipeline] getContext
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] cleanWs
[WS-CLEANUP] Deleting project workspace...
[WS-CLEANUP] Deferred wipeout is used...
[WS-CLEANUP] done
[Pipeline] echo
Pipeline failed!
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Also: org.jenkinsci.plugins.workflow.actions.ErrorAction$ErrorId: 71473ddb-f352-4a60-bb22-668d62b5202b
java.lang.NoSuchMethodError: No such DSL method 'publishTestResults' found among steps [archive, bat, build, catchError, checkout, deleteDir, dir, echo, emailext, emailextrecipients, envVarsForTool, error, fileExists, findBuildScans, getContext, git, input, isUnix, junit, library, libraryResource, load, mail, milestone, node, parallel, powershell, properties, publishChecks, publishHTML, pwd, pwsh, readFile, readTrusted, resolveScm, retry, script, setGitHubPullRequestStatus, sh, sleep, stage, stash, step, timeout, timestamps, tm, tool, unarchive, unstable, unstash, validateDeclarativePipeline, waitForBuild, waitUntil, warnError, withChecks, withContext, withCredentials, withEnv, withGradle, wrap, writeFile, ws] or symbols [GitUsernamePassword, Number, Open, agent, all, allBranchesSame, allOf, allowRunOnStatus, always, ant, antFromApache, antOutcome, antTarget, any, anyOf, apiToken, apiTokenProperty, architecture, archiveArtifacts, artifactManager, asIsGITScm, assembla, authorInChangelog, authorizationMatrix, azureCLI, azureServicePrincipal, batchFile, bitbucket, bitbucketBranchDiscovery, bitbucketBuildStatusNotifications, bitbucketDiscardOldBranch, bitbucketDiscardOldTag, bitbucketForkDiscovery, bitbucketPRTargetBranchRefSpec, bitbucketPublicRepoPullRequestFilter, bitbucketPullRequestDiscovery, bitbucketServer, bitbucketSshCheckout, bitbucketTagDiscovery, bitbucketTrustEveryone, bitbucketTrustNobody, bitbucketTrustProject, bitbucketTrustTeam, bitbucketWebhookConfiguration, bitbucketWebhookRegistration, booleanParam, branch, branchCreated, branches, brokenBuildSuspects, brokenTestsSuspects, browser, buildButton, buildDiscarder, buildDiscarders, buildRetention, buildSingleRevisionOnly, buildUser, buildingTag, builtInNode, caseInsensitive, caseSensitive, certificate, cgit, changeRequest, changelog, changelogBase, changelogToBranch, changeset, checkoutOption, checkoutToSubdirectory, choice, choiceParam, cleanAfterCheckout, cleanBeforeCheckout, cleanWs, clock, cloneOption, close, command, commentPattern, commit, commitChanged, commitMessagePattern, computerRetentionCheckInterval, consoleUrlProvider, contributor, cps, created, credentials, cron, crumb, culprits, dark, darkSystem, default, defaultDisplayUrlProvider, defaultFolderConfiguration, defaultView, deleted, demand, description, developers, disableConcurrentBuilds, disableRestartFromStage, disableResume, discoverOtherRefs, discoverOtherRefsTrait, diskSpace, diskSpaceMonitor, downstream, dumb, durabilityHint, email-ext, envVars, envVarsFilter, environment, equals, experimentalFlags, expression, extendedEmailPublisher, file, fileParam, filePath, fingerprint, fingerprints, firstBuildChangelog, fisheye, frameOptions, freeStyle, freeStyleJob, fromScm, fromSource, git, gitBranchDiscovery, gitHooks, gitHub, gitHubBranchDiscovery, gitHubBranchHeadAuthority, gitHubEvents, gitHubExcludeArchivedRepositories, gitHubExcludeForkedRepositories, gitHubExcludePrivateRepositories, gitHubExcludePublicRepositories, gitHubForkDiscovery, gitHubIgnoreDraftPullRequestFilter, gitHubPRStatus, gitHubPlugin, gitHubPullRequestDiscovery, gitHubSshCheckout, gitHubTagDiscovery, gitHubTopicsFilter, gitHubTrustContributors, gitHubTrustEveryone, gitHubTrustNobody, gitHubTrustPermissions, gitLab, gitList, gitSCM, gitTagDiscovery, gitTool, gitUsernamePassword, gitWeb, gitblit, github, githubBranches, githubPRAddLabels, githubPRClosePublisher, githubPRComment, githubPRMessage, githubPRRemoveLabels, githubPRStatusPublisher, githubPlugin, githubProjectProperty, githubPullRequests, githubPush, gitiles, gogs, gradle, group, hashChanged, headRegexFilter, headWildcardFilter, hyperlink, hyperlinkToModels, ignoreOnPush, inbound, inheriting, inheritingGlobal, installSource, isRestartedRun, jdk, jdkInstaller, jgit, jgitapache, jnlp, jobBuildDiscarder, jobName, junitTestResultStorage, kiln, label, labels, labelsAdded, labelsExist, labelsNotExist, labelsPatternExists, labelsRemoved, lastDuration, lastFailure, lastGrantedAuthorities, lastStable, lastSuccess, legacy, legacySCM, lfs, list, local, localBranch, localBranchTrait, location, logRotator, loggedInUsersCanDoAnything, mailer, masterBuild, maven, maven3Mojos, mavenErrors, mavenGlobalConfig, mavenMojos, mavenWarnings, message, modernSCM, multiBranchProjectDisplayNaming, multibranch, myView, namedBranchesDifferent, noGITScm, node, nodeProperties, nonInheriting, nonMergeable, none, nonresumable, not, organizationFolder, overrideIndexTriggers, paneStatus, parallelsAlwaysFailFast, parameters, password, pattern, perBuildTag, permanent, phabricator, pipeline, pipelineGraphView, pipelineTriggers, plainText, plugin, pollSCM, preserveStashes, previous, projectNamingStrategy, proxy, pruneStaleBranch, pruneStaleTag, pruneTags, pullRequest, pullRequests, queueItemAuthenticator, quietPeriod, rateLimit, rateLimitBuilds, recipients, redmine, refSpecs, remoteName, requestor, resourceRoot, responseTime, restriction, restrictions, retainOnlyVariables, rhodeCode, run, runParam, sSHLauncher, schedule, scmGit, scmRetryCount, scriptApproval, scriptApprovalLink, search, security, shell, showBitbucketAvatar, simpleBuildDiscarder, skipDefaultCheckout, skipStagesAfterUnstable, slave, sourceRegexFilter, sourceWildcardFilter, sparseCheckout, sparseCheckoutPaths, ssh, sshPublicKey, sshUserPrivateKey, standard, status, statusOnPublisherError, string, stringParam, submodule, submoduleOption, suppressAutomaticTriggering, suppressFolderAutomaticTriggering, swapSpace, tag, tags, teamFoundation, teamSlugFilter, text, textParam, themeManager, timestamper, timestamperConfig, timezone, tmpSpace, toolLocation, triggeredBy, unsecured, untrusted, upstream, upstreamDevelopers, user, userIdentity, userOrGroup, userSeed, usernameColonPassword, usernamePassword, viewgit, viewsTabBar, weather, withAnt, zip] or globals [currentBuild, env, params, pipeline, scm]
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.DSL.invokeMethod(DSL.java:219)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsScript.invokeMethod(CpsScript.java:124)
	at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:103)
	at java.base/java.lang.reflect.Method.invoke(Method.java:580)
	at org.codehaus.groovy.reflection.CachedMethod.invoke(CachedMethod.java:98)
	at groovy.lang.MetaMethod.doMethodInvoke(MetaMethod.java:325)
	at groovy.lang.MetaClassImpl.invokeMethod(MetaClassImpl.java:1225)
	at groovy.lang.MetaClassImpl.invokeMethod(MetaClassImpl.java:1034)
	at org.codehaus.groovy.runtime.callsite.PogoMetaClassSite.call(PogoMetaClassSite.java:41)
	at org.codehaus.groovy.runtime.callsite.CallSiteArray.defaultCall(CallSiteArray.java:47)
	at org.codehaus.groovy.runtime.callsite.AbstractCallSite.call(AbstractCallSite.java:116)
	at PluginClassLoader for script-security//org.kohsuke.groovy.sandbox.impl.Checker$1.call(Checker.java:180)
	at PluginClassLoader for script-security//org.kohsuke.groovy.sandbox.GroovyInterceptor.onMethodCall(GroovyInterceptor.java:23)
	at PluginClassLoader for script-security//org.jenkinsci.plugins.scriptsecurity.sandbox.groovy.SandboxInterceptor.onMethodCall(SandboxInterceptor.java:163)
	at PluginClassLoader for script-security//org.kohsuke.groovy.sandbox.impl.Checker$1.call(Checker.java:178)
	at PluginClassLoader for script-security//org.kohsuke.groovy.sandbox.impl.Checker.checkedCall(Checker.java:182)
	at PluginClassLoader for script-security//org.kohsuke.groovy.sandbox.impl.Checker.checkedCall(Checker.java:152)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.sandbox.SandboxInvoker.methodCall(SandboxInvoker.java:17)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.LoggingInvoker.methodCall(LoggingInvoker.java:118)
	at WorkflowScript.run(WorkflowScript:38)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.delegateAndExecute(ModelInterpreter.groovy:139)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.runPostConditions(ModelInterpreter.groovy:728)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.catchRequiredContextForNode(ModelInterpreter.groovy:390)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.runPostConditions(ModelInterpreter.groovy:727)
	at com.cloudbees.groovy.cps.CpsDefaultGroovyMethods.each(CpsDefaultGroovyMethods:2125)
	at com.cloudbees.groovy.cps.CpsDefaultGroovyMethods.each(CpsDefaultGroovyMethods:2110)
	at com.cloudbees.groovy.cps.CpsDefaultGroovyMethods.each(CpsDefaultGroovyMethods:2151)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.runPostConditions(ModelInterpreter.groovy:717)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.executeSingleStage(ModelInterpreter.groovy:644)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:292)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.toolsBlock(ModelInterpreter.groovy:521)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:280)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.withEnvBlock(ModelInterpreter.groovy:432)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:279)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.withCredentialsBlock(ModelInterpreter.groovy:464)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:278)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.inDeclarativeAgent(ModelInterpreter.groovy:561)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:276)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.stageInput(ModelInterpreter.groovy:354)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:265)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.inWrappers(ModelInterpreter.groovy:592)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:263)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.withEnvBlock(ModelInterpreter.groovy:432)
	at org.jenkinsci.plugins.pipeline.modeldefinition.ModelInterpreter.evaluateStage(ModelInterpreter.groovy:258)
	at ___cps.transform___(Native Method)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.ContinuationGroup.methodCall(ContinuationGroup.java:90)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.FunctionCallBlock$ContinuationImpl.dispatchOrArg(FunctionCallBlock.java:114)
at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.FunctionCallBlock$ContinuationImpl.fixArg(FunctionCallBlock.java:83)
	at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:103)
	at java.base/java.lang.reflect.Method.invoke(Method.java:580)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.ContinuationPtr$ContinuationImpl.receive(ContinuationPtr.java:72)
at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.CollectionLiteralBlock$ContinuationImpl.dispatch(CollectionLiteralBlock.java:55)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.CollectionLiteralBlock$ContinuationImpl.item(CollectionLiteralBlock.java:45)
at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:103)
at java.base/java.lang.reflect.Method.invoke(Method.java:580)
at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.ContinuationPtr$ContinuationImpl.receive(ContinuationPtr.java:72)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.impl.ConstantBlock.eval(ConstantBlock.java:21)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.Next.step(Next.java:83)
	at PluginClassLoader for workflow-cps//com.cloudbees.groovy.cps.Continuable.run0(Continuable.java:147)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.SandboxContinuable.access$001(SandboxContinuable.java:17)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.SandboxContinuable.run0(SandboxContinuable.java:49)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsThread.runNextChunk(CpsThread.java:180)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsThreadGroup.run(CpsThreadGroup.java:419)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsThreadGroup$2.call(CpsThreadGroup.java:327)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsThreadGroup$2.call(CpsThreadGroup.java:292)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsVmExecutorService.lambda$wrap$4(CpsVmExecutorService.java:140)
	at java.base/java.util.concurrent.FutureTask.run(FutureTask.java:317)
	at hudson.remoting.SingleLaneExecutorService$1.run(SingleLaneExecutorService.java:139)
	at jenkins.util.ContextResettingExecutorService$1.run(ContextResettingExecutorService.java:28)
	at jenkins.security.ImpersonatingExecutorService$1.run(ImpersonatingExecutorService.java:68)
	at jenkins.util.ErrorLoggingExecutorService.lambda$wrap$0(ErrorLoggingExecutorService.java:51)
	at java.base/java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:572)
at java.base/java.util.concurrent.FutureTask.run(FutureTask.java:317)
at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1144)
at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:642)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsVmExecutorService$1.call(CpsVmExecutorService.java:53)
	at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsVmExecutorService$1.call(CpsVmExecutorService.java:50)
	at org.codehaus.groovy.runtime.GroovyCategorySupport$ThreadCategoryInfo.use(GroovyCategorySupport.java:136)
at org.codehaus.groovy.runtime.GroovyCategorySupport.use(GroovyCategorySupport.java:275)
at PluginClassLoader for workflow-cps//org.jenkinsci.plugins.workflow.cps.CpsVmExecutorService.lambda$categoryThreadFactory$0(CpsVmExecutorService.java:50)
at java.base/java.lang.Thread.run(Thread.java:1583)
Finished: FAILURE
