The purpose of this repo is to create all the bits and bobs that come with deploying even a simple app. I am using it to further my knowledge of each part of the SLDC from formatting code, building containers, creating infrastructure, deploying an app and infrastructure separately, keeping packages up to date. 

There is a lot of things to consider :D - The overall goal of the project, other than learning the individual aspects of what go into an app, is to better learn to plan and make decisions about technologies.


## Phase 1 - Build Containers, Static Analysis, Dependency Management and Project Config

### Initial decisions
* For my container tooling I have chosen Docker. Reason being I am familiar with it, but there are lots more things I'd like to learn about it. I am thinking of using ECR/ECS as a container registry and run-time, we'll see.
* For my CI I've chosen to use github actions, it is the least effort to spin up - anything to stay away from Jenkins.
* For my language I chose Python in order to get some more practice, I chose Django as a framework as it is something I am unfamiliar with and is very well documented / has large community support.
* For my dependency management I chose Poetry to try something new. I really like the user experience so far compared to pip - maybe this feeling won't last forever.

### Goal
The goal of `Phase 1` was very simple: Get a containerized web-app running, and have some basic tooling to make local development easier.

### Thoughts
There is a LOT that goes into starting a project from scratch - I guess this is why boilerplate repos exist. 

### What's Next? 
For phase 2 I think I will focus on getting my container published and using a cloud container run-time to run my containers in a cluster (of 1 for money purposes). This will point me more towards the aspects of the project that are infra/platform.

Things I want to keep in mind:
* When developing an app: What is the best time to instrument an application? Instrument meaning something like open telemetry. 
* How to design the build/deployment flows to keep infrastructure and application code completely separate.
* How to keep the developer experience in mind?
* (for further down): Do I deploy versioned apps (ie. something like packages), or do "on merge to main, that is the new live version?" 
* (for further down): When do I add something like dependa-bot or renovate to manage package versions? (Probably ASAP :D) 