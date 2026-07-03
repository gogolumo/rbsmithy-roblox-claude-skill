--!strict

export type ExperimentVariant = "Control" | "VariantA"

local ExperimentConfig = {
    TutorialOpening = {
        Key = "tutorial_opening_v1",
        Variants = { "Control", "VariantA" },
        Default = "Control" :: ExperimentVariant,
        Description = "Control starts with NPC dialogue; VariantA starts with ship movement.",
    },
}

table.freeze(ExperimentConfig)
return ExperimentConfig
