
exports.descriptors = [

  name: 'Strong willed'
  description: '''
    You’re tough-minded, willful, and independent.
    No one can talk you into anything or change your mind when you don’t want it changed.
    This quality doesn’t necessarily make you smart, but it does make you a bastion of willpower and resolve.
    You likely dress and act with unique style and flair, not caring what others think.
  '''
  mechanics: [
    'pool: +4 Intellect'
    'skill: resisting mental effects'
    'skill: focus and concentration'
    'unskill: puzzles or problems, memory, lore'
  ]
]


exports.specialAbilities = [
  name: 'Onslaught'
  type: 'nano'
  tier: 1
  cost: '1 Intellect'
  resolution: 'action'
  description: '''
    You attack a foe using energies that assail either his physical form or his mind.
    In either case, you must be able to see your target.
    If the attack is physical, you emit a short-range ray of force that inflicts 4 points of damage.
    If the attack is mental, you focus your mental energy to blast the thought processes of another creature within short range.
    This mindslice inflicts 2 points of Intellect damage (and thus ignores Armor).
    Some creatures without minds (such as automatons) might be immune to mindslice.
    '''
]


exports.foci = [

  name: 'Carries a quiver'
  description: '''
    The archer is a skilled combatant, deadly in any fight. With a
    keen eye and quick reflexes, you can eliminate foes at range
    before they reach you. A good archer also learns to make
    his own arrows and bows.
    You probably wear no more than light armor so you can
    move quickly when needed.
    Many glaives and jacks are archers.
    You can use this focus with crossbows instead of bows if
    you wish.
    '''
  connection: '''
    Pick one other PC to be the true friend who
    gave you the excellent bow that you currently use. Secretly
    pick a second PC (preferably one who is likely to get in the
    way of your attacks). When you miss with a bow and the
    GM rules that you struck someone other than your target,
    you hit the second character, if possible.
    '''
  equipment: 'You start with a well-made bow and two dozen arrows.'
  minor: 'Hit in a tendon or muscle, the target takes 2 points of Speed damage as well as normal damage.'
  major: 'The target is pinned in place with an arrow.'
]


