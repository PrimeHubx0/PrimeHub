local Library = {}

local function Drag()
    local UserInputService = game:GetService("UserInputService")

    local gui = script.Parent
    
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

Drag()

function Library:AddWindow(name)
    local PrimeHub = Instance.new("ScreenGui")
    local Container = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Title = Instance.new("Frame")
    local Tit = Instance.new("UICorner")
    local Hub = Instance.new("TextLabel")
    local Name = Instance.new("TextLabel")
    local Logo = Instance.new("ImageLabel")

    PrimeHub.Name = "Prime Hub"
    PrimeHub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    PrimeHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Container.Name = "Container"
    Container.Parent = PrimeHub
    Container.BackgroundColor3 = Color3.fromRGB(89, 89, 89)
    Container.Position = UDim2.new(0.394787967, 0, 0.306317061, 0)
    Container.Size = UDim2.new(0, 686, 0, 324)
    
    UICorner.CornerRadius = UDim.new(0, 9)
    UICorner.Parent = Container
    
    Title.Name = "Title"
    Title.Parent = Container
    Title.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
    Title.Size = UDim2.new(0, 686, 0, 30)
    
    Tit.CornerRadius = UDim.new(0, 9)
    Tit.Name = "Tit"
    Tit.Parent = Title
    
    Hub.Name = "Hub"
    Hub.Parent = Title
    Hub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Hub.BackgroundTransparency = 1.000
    Hub.BorderColor3 = Color3.fromRGB(130, 203, 255)
    Hub.Position = UDim2.new(0.116902255, 0, 0.0906951874, 0)
    Hub.Size = UDim2.new(0, 124, 0, 25)
    Hub.Font = Enum.Font.GothamBold
    Hub.Text = "Hub"
    Hub.TextColor3 = Color3.fromRGB(130, 203, 255)
    Hub.TextScaled = true
    Hub.TextSize = 14.000
    Hub.TextWrapped = true
    
    Name.Name = "Name"
    Name.Parent = Title
    Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Name.BackgroundTransparency = 1.000
    Name.Position = UDim2.new(0.0300687328, 0, 0.0906953812, 0)
    Name.Size = UDim2.new(0, 119, 0, 25)
    Name.Font = Enum.Font.GothamBold
    Name.Text = name
    Name.TextColor3 = Color3.fromRGB(255, 255, 255)
    Name.TextScaled = true
    Name.TextSize = 14.000
    Name.TextWrapped = true
    
    Logo.Name = "Logo"
    Logo.Parent = Title
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.Position = UDim2.new(0.00979021005, 0, -0.125641033, 0)
    Logo.Size = UDim2.new(0, 32, 0, 31)
    Logo.Image = "http://www.roblox.com/asset/?id=5245791520"

    local Tab = {}

    function Tab:Page(name)
        local TabList = Instance.new("Frame")
        local TabListFrame = Instance.new("UICorner")
        local Tab = Instance.new("TextButton")
        local TabLayout = Instance.new("UIGridLayout")
        local ScrollingFrame = Instance.new("ScrollingFrame")

        TabList.Name = "TabList"
        TabList.Parent = Title
        TabList.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
        TabList.Position = UDim2.new(0.0213223565, 0, 1.20000005, 0)
        TabList.Size = UDim2.new(0, 656, 0, 26)
        
        TabListFrame.CornerRadius = UDim.new(0, 9)
        TabListFrame.Name = "TabListFrame"
        TabListFrame.Parent = TabList
        
        Tab.Name = "Tab"
        Tab.Parent = TabList
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 1.000
        Tab.Position = UDim2.new(0.00914634392, 0, 0.115384616, 0)
        Tab.Size = UDim2.new(0, 87, 0, 20)
        Tab.Font = Enum.Font.GothamBold
        Tab.Text = name
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextScaled = true
        Tab.TextSize = 14.000
        Tab.TextWrapped = true
        
        ScrollingFrame.Parent = Tab
        ScrollingFrame.Active = true
        ScrollingFrame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
        ScrollingFrame.BorderColor3 = Color3.fromRGB(43, 43, 43)
        ScrollingFrame.Position = UDim2.new(-0.068999894, 0, 1.54999995, 0)
        ScrollingFrame.Size = UDim2.new(0, 656, 0, 239)
    end
    return Tab
end
