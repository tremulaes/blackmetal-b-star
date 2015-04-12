module Bullets
  @@player_bullets = []
  @@enemy_bullets = []

  def self.player_bullets
    @@player_bullets
  end

  def self.enemy_bullets
    @@enemy_bullets
  end

  def self.destroy(bullet)
    @@player_bullets.delete(bullet)
    @@enemy_bullets.delete(bullet)
  end

  def self.create(hash)
    case hash[:type]
    when :p_bullet
      @@player_bullets << Bullet.new(hash)
    when :p_light_orbs
      @@player_bullets << LightOrb.new(hash)
    when :e_bullet
      @@enemy_bullets << EnemyBullet.new(hash)
    end
  end

  def self.update
    bullets.each { |b| b.update }
    self.clean(@@player_bullets)
    self.clean(@@enemy_bullets)
  end

  def self.draw
    bullets.each { |b| b.draw }
  end

  def self.clean(bullets)
    bullets.delete_if { |b| b.x + b.width < 0 || b.x > Game::FIELD_W || b.y + b.height < 0 || b.y > Game::FIELD_W }
  end

  def self.bullets
    @@player_bullets + @@enemy_bullets
  end
end
