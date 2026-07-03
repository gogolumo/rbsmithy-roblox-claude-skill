# A/B Testing and Experiments

Use this reference when testing variants of onboarding, UI, controls, rewards, economy, matchmaking, tutorials, or retention features.

## Purpose

Experiments should answer a specific product question. They are not a replacement for good design or QA.

Good question:

```text
Does starting the tutorial with ship movement improve tutorial completion compared to starting with NPC dialogue?
```

Bad question:

```text
Which random version feels better?
```

## Experiment design checklist

- hypothesis
- control variant
- test variant
- target audience
- success metric
- guardrail metrics
- runtime
- rollout percentage
- server/client implementation notes
- analytics events
- rollback plan

## Metrics

Possible success metrics:

- tutorial completion rate
- 1-day retention
- first quest completion
- first purchase conversion
- session length
- party/crew formation

Guardrails:

- crash/error spikes
- negative feedback
- lower mobile completion
- worse performance
- economy inflation
- higher player deaths before reward

## Implementation rule

Do not bake experiment decisions into many random scripts. Centralize them:

```text
ReplicatedStorage/Shared/Experiments/ExperimentConfig
ServerScriptService/Services/ExperimentService
```

## Avoid

- changing too many things in one experiment;
- using client-only decisions for server-owned logic;
- making pay-to-win experiment variants;
- continuing an experiment after a serious bug is detected;
- shipping experiment code without cleanup plan.
