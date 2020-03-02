image_player = nil
image_ice_cream = nil
sound_effect = nil

function love.load()
  -- Load images & sound effects
end

points = 0
bonus = 0

function love.update(delta)
  -- Handle movement & collision & scoring
end

function love.draw()
  -- Draw player & ice cream & points
end

function love.mousemoved(x)
  -- Update player position
end

player_position_x = 0
player_position_y = 30

function update_player(x, y)
  -- Update player position
end

function draw_player()
  -- Draw player
end

ice_cream_color_r    = 1
ice_cream_color_g    = 1
ice_cream_color_b    = 1
ice_cream_position_x = 0
ice_cream_position_y = 0
ice_cream_speed      = 200

function spawn_ice_cream()
  -- Make ice cream
end

function update_ice_cream(delta)
  -- Update ice cream
end

function draw_ice_cream()
  -- Draw ice cream
end

function is_box_in_box(x1, y1, w1, h1, x2, y2, w2, h2)
  return x1 + w1 >= x2      and
         x1      <= x2 + h2 and
         y1 + h1 >= y2      and
         y1      <= y2 + h2
end
