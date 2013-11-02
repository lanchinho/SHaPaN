  FrameList = {"Player", "Target", "Focus"}
  function UpdateHealthValues(...)
    for i = 1, select("#", unpack(FrameList)) do
      local FrameName = (select(i, unpack(FrameList)))
      if UnitHealth(FrameName) < 1000 then
        local Health = UnitHealth(FrameName)
        local HealthMax = UnitHealthMax(FrameName)
      else
        local Health = (UnitHealth(FrameName))/1000
        local HealthMax = (UnitHealthMax(FrameName))/1000
        local HealthPercent = (UnitHealth(FrameName)/UnitHealthMax(FrameName))*100
        if UnitHealth(FrameName) < 1000 then
          _G[FrameName.."FrameHealthBar"].TextString:SetText(Health.." / "..HealthMax.." ("..format("%.0f",HealthPercent).."%)")
        else
          _G[FrameName.."FrameHealthBar"].TextString:SetText(format("%.0f",Health).."k / "..format("%.0f",HealthMax).."k ("..format("%.0f",HealthPercent).."%)")
        end
      end
    end
  end 
  hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", UpdateHealthValues)
