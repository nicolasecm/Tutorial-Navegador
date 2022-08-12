local navOpen = false

function renderBrowser()
    dxDrawImage(100,100,800,500, webBrowser, 0, 0,0, tocolor(255,255,255,255),true)
end

function createNav()
    if not navOpen then
        navOpen = true
        webBrowser = createBrowser(1000,1000, false, false)
        addEventHandler("onClientRender", root, renderBrowser)
        addEventHandler("onClientBrowserCreated", webBrowser, function()
            loadBrowserURL(webBrowser, "http://www.youtube.com/c/nicolasecm")
        end)
        showCursor(true)
    else
        navOpen = false
        destroyElement(webBrowser)
        removeEventHandler("onClientRender", root, renderBrowser)
        showCursor(false)
    end
end
addCommandHandler("nav",createNav)