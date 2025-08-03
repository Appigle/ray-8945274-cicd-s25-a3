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
> Checking out Revision 8d7dab4dea47d4a0679b925213b200eef5eb2f6c (refs/remotes/origin/main)
> git config core.sparsecheckout # timeout=10
> git checkout -f 8d7dab4dea47d4a0679b925213b200eef5eb2f6c # timeout=10
> Commit message: "fix: update jenkinsfile"
> git rev-list --no-walk a71f935e2c06d0128b2750be3a3f7e16b562eba8 # timeout=10
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
> Checking out Revision 8d7dab4dea47d4a0679b925213b200eef5eb2f6c (refs/remotes/origin/main)
> git config core.sparsecheckout # timeout=10
> git checkout -f 8d7dab4dea47d4a0679b925213b200eef5eb2f6c # timeout=10
> Commit message: "fix: update jenkinsfile"
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
✓ should return "Hello, World!" message
✓ should return correct content type header

Test Suites: 1 passed, 1 total
Tests: 3 passed, 3 total
Snapshots: 0 total
Time: 0.13 s, estimated 1 s
Ran all test suites.
[Pipeline] }
[Pipeline] // script
Post stage
[Pipeline] script
[Pipeline] {
[Pipeline] fileExists
[Pipeline] }
[Pipeline] // script
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Deploy)
[Pipeline] script
[Pipeline] {
[Pipeline] echo
Deploying to Azure...
[Pipeline] sh

- command -v func
- echo 'Installing Azure Functions Core Tools...'
  Installing Azure Functions Core Tools...
- npm install -g azure-functions-core-tools@4 --unsafe-perm true

added 35 packages in 1m

5 packages are looking for funding
run `npm fund` for details
[Pipeline] sh

- command -v az
- echo 'Azure CLI not found, installing...'
  Azure CLI not found, installing...
- curl -sL https://aka.ms/InstallAzureCLIDeb
- sudo bash
  sudo: a terminal is required to read the password; either use the -S option to read from standard input or configure an askpass helper
  sudo: a password is required

[Pipeline] }
[Pipeline] // script
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
ERROR: script returned exit code 1
Finished: FAILURE
