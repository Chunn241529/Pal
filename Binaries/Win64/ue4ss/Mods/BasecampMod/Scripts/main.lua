-- Palworld UE4SS Lua Mod

-- Game Class: BaseCamp
local BaseCamp = FindFirstOf("BaseCamp")

if BaseCamp then
    -- 팰 최대치 조정
    BaseCamp.MaxPalCount = 120  -- 기본 최대 팰 수 120마리
    BaseCamp.PalCountPerLevel = 4  -- 레벨업당 증가 팰 수 4마리

    -- 거점 설치 가능 수 조정
    BaseCamp.MaxBaseCount = 30  -- 기본 최대 거점 수 30개
    BaseCamp.BaseCountPerLevel = 1  -- 레벨업당 증가 거점 수 1개

    print("[UE4SS] BaseCamp Settings Modified: Max Pals = " .. BaseCamp.MaxPalCount .. ", Max Bases = " .. BaseCamp.MaxBaseCount)
else
    print("[UE4SS] BaseCamp class not found!")
end
