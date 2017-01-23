fps = 1/25                                   -- Set Fps

function love.load()
	videostream = love.video.newVideoStream("assets/video/video.ogv" )
	video = love.graphics.newVideo( videostream)
	video:play()
end

function love.update()
--	if(videostream:isPlaying()) then
--	else closeVideo()
	--end
end --update

function closeVideo()
end

function love.draw()
    love.graphics.draw(video, 90, 50)
end
