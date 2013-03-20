# works with .should and expect syntax
# @user.should have_ability(:create, for: Post.new)
# @user.should have_ability([:create, :read], for: Post.new)
# @user.should have_ability({create: true, read: false, update: false, destroy: true}, for: Post.new)
RSpec::Matchers.define :have_ability do |ability_hash, options = {}|
  match do |user|
    ability         = Ability.new user
    target          = options[:for]
    @ability_result = {}
    ability_hash    = {ability_hash: true} if ability_hash.is_a? Symbol # e.g.: :create => {:create => true}
    ability_hash    = ability_hash.inject({}){|_, i| _.merge({i: true}) } if ability_hash.is_a? Array # e.g.: [:create, :read] => {:create=>true, :read=>true}
    ability_hash.each do |action, true_or_false|
      @ability_result[action] = ability.can?(action, target)
    end
    !ability_hash.diff(@ability_result).any?
  end

  failure_message_for_should do |user|
    ability_hash,options = expected
    ability_hash         = {ability_hash: true} if ability_hash.is_a? Symbol # e.g.: :create
    ability_hash         = ability_hash.inject({}){|_, i| _.merge({i: true}) } if ability_hash.is_a? Array # e.g.: [:create, :read] => {:create=>true, :read=>true}
    target               = options[:for]
    message              = "expected User:#{user} to have ability:#{ability_hash} for #{target}, but actual result is #{@ability_result}"
  end

  #to clean up output of RSpec Documentation format
  description do 
    if ability_hash.length == 1
      "have ability #{expected.to_s.match(/(:[^ ]*)/)[1]} for #{expected.to_s.match(/<([^ ]*)/)[1]}"
    else
      "have abilities #{expected.to_s.match(/\[(\[[^\]]*\]),/)[1]} for #{expected.to_s.match(/<([^ ]*)/)[1]}"
    end
  end
end