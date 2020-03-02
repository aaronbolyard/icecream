image_player = nil
image_ice_cream = nil
sound_effect = nil

function love.load()
  image_player = love.graphics.newImage("images/player.png")
  image_ice_cream = love.graphics.newImage("images/ice_cream.png")
  sound_effect = love.audio.newSource("sounds/ice_cream.wav", 'static')

  math.randomseed(os.time())
end

points = 0
bonus = 0

function love.update(delta)
  update_ice_cream(delta)

  did_collide = is_box_in_box(
    player_position_x,
    player_position_y,
    image_player:getWidth(),
    image_player:getHeight(),
    ice_cream_position_x,
    ice_cream_position_y,
    image_ice_cream:getWidth(),
    image_ice_cream:getHeight()
  )

  if did_collide then
    bonus = bonus + 1
    points = points + bonus
    ice_cream_speed = ice_cream_speed * 1.05

    sound_effect:seek(0)
    sound_effect:play()
  end

  if ice_cream_position_y < 0 then
    ice_cream_speed = 200
    bonus = 0
  end

  if did_collide or ice_cream_position_y < 0 then
    spawn_ice_cream()
  end
end

function love.draw()
  draw_player()
  draw_ice_cream()

  love.graphics.printf(
    string.format("Points: %d (+%d bonus)", points, bonus),
    10,
    10,
    200,
    'left')
end

function love.mousemoved(x)
  update_player(x, player_position_y)
end

player_position_x = 0
player_position_y = 30

function update_player(x, y)
  player_position_x = x
  player_position_y = y
end

function draw_player()
  scale = math.abs(math.sin(player_position_x / 64)) * 0.2 + 0.8

  -- image, x, y, rotation (radians), scaleX, scaleY, originX, originY, skewX, skewY
  love.graphics.draw(
    image_player,
    player_position_x,
    player_position_y,
    0,
    1,
    scale
  )
end

ice_cream_color_r    = 1
ice_cream_color_g    = 1
ice_cream_color_b    = 1
ice_cream_position_x = 0
ice_cream_position_y = 0
ice_cream_speed      = 200

function spawn_ice_cream()
  window_width, window_height = love.window.getMode()
  ice_cream_position_x = math.random(0, window_width - image_ice_cream:getWidth())
  ice_cream_position_y = window_height

  ice_cream_color_r = math.random() * 0.3 + 0.7
  ice_cream_color_g = math.random() * 0.3 + 0.7
  ice_cream_color_b = math.random() * 0.3 + 0.7
end

function update_ice_cream(delta)
  ice_cream_position_y = ice_cream_position_y - ice_cream_speed * delta
end

function draw_ice_cream()
  love.graphics.setColor(ice_cream_color_r, ice_cream_color_g, ice_cream_color_b)

  love.graphics.draw(
    image_ice_cream,
    ice_cream_position_x,
    ice_cream_position_y
  )

  love.graphics.setColor(1, 1, 1, 1)
end

function is_box_in_box(x1, y1, w1, h1, x2, y2, w2, h2)
  return x1 + w1 >= x2      and
         x1      <= x2 + h2 and
         y1 + h1 >= y2      and
         y1      <= y2 + h2
end
