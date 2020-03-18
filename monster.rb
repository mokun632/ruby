require './character'

class Monster < Character

  SPECIAL_MONSTER_ATTACK_CONSTANT = 1.5
  CALC_HARF_HP = 0.5

  def initialize(**params)
   super(
    name: params[:name],
    hp: params[:hp],
    offense: params[:offense],
    defense: params[:defense]
   )

    @transform_flg = false
    @trigger_of_transform = params[:hp] * CALC_HARF_HP

  end

  def attack(brave)

    # puts "#{@name}の攻撃"
    attack_message

    if @hp <= @trigger_of_transform && @transform_flg == false
      @transform_flg = true
      transform
    else
      # puts "通常攻撃"
    end

    damage = calculate_damage(target: brave, transform_flg: @transform_flg)
    cause_damage(target: brave, damage: damage)
    # puts  "#{target.name}の残りHPは#{target.hp}だ"
    damage_message(target: brave, damage: damage)
  end

  private

  def calculate_damage(**params)
    if params[:transform_flg]
      @offense *= SPECIAL_MONSTER_ATTACK_CONSTANT
    end
      @offense - params[:target].defense
  end

  def cause_damage(**params)

    damage = params[:damage]
    target = params[:target]

    target.hp -= damage
    target.hp = 0 if target.hp < 0
    # puts  "#{params[:target].name}は#{damage}のダメージを受けた"
  end

  def transform
    transform_name = "ドラゴン"
    transform_message(origin_name: @name, transform_name: transform_name)
    # puts <<~EOS
    #   #{@name}は怒っている
    #   #{@name}は#{transform_name}に変身した
    #   EOS
    @name = transform_name
  end

end
