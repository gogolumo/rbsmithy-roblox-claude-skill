--!strict

export type MusicZone = {
    Key: string,
    Priority: number,
    FadeSeconds: number,
}

local MusicZoneConfig = {
    Ocean = { Key = "ambience.ocean", Priority = 1, FadeSeconds = 2.0 },
    Town = { Key = "music.town", Priority = 2, FadeSeconds = 1.5 },
    Boss = { Key = "music.boss", Priority = 10, FadeSeconds = 0.5 },
}

return MusicZoneConfig
