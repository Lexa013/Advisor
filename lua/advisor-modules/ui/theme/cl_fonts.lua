local TextScaleConVar = CreateClientConVar("advisor_text_scale", "1", true, false, "Scale the Advisor font according to your screen's pixel density", 0.5, 2)

local function SizeByRatio(x)
  return (x / 2560 * ScrW()) * TextScaleConVar:GetFloat()
end


local function GenerateAdvisorFonts()
    surface.CreateFont("Advisor:Rubik.Header",
    {
        font = "Rubik",
        size = SizeByRatio(24),
        antialias = true,
    })

    surface.CreateFont("Advisor:Rubik.Footer",
    {
        font = "Rubik",
        size = SizeByRatio(20),
        antialias = true,
    })

    surface.CreateFont("Advisor:Rubik.Body",
    {
        font = "Rubik",
        size = SizeByRatio(22),
        antialias = true,
    })

    surface.CreateFont("Advisor:Rubik.Button",
    {
        font = "Rubik",
        size = SizeByRatio(24),
        antialias = true,
        weight = 525,
    })

    surface.CreateFont("Advisor:Rubik.TextEntry", 
    {
        font = "Rubik",
        size = SizeByRatio(20),
        antialias = true,
    })

    surface.CreateFont("Advisor:Awesome",
    {
        font = "Font Awesome 5 Free Solid",
        antialias = true,
        extended = true,
        size = SizeByRatio(20),
    })

    surface.CreateFont("Advisor:SmallAwesome",
    {
        font = "Font Awesome 5 Free Solid",
        antialias = true,
        extended = true,
        size = SizeByRatio(16),
    })
end

GenerateAdvisorFonts()

hook.Add("OnScreenSizeChanged", "Advisor:OnScreenSizeChanged:ReGenerateFonts", GenerateAdvisorFonts)
-- Update the fonts when the text size convar is updated
cvars.AddChangeCallback("advisor_text_scale", function(name, old, new)
    GenerateAdvisorFonts()
end)