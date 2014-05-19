# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([
  {
    first_name: "Jose",
    last_name: "Borja",
    username: "chakaitos",
    email: "chakaitos@gmail.com",
    password: "password",
    password_confirmation: "password",
    admin: true
  },
  {
    first_name: "Drew",
    last_name: "Garcia",
    username: "drewg233",
    email: "drewgarcia23@gmail.com",
    password: "password",
    password_confirmation: "password",
    admin: true
  },
  {
    first_name: "Test",
    last_name: "User",
    username: "test",
    email: "test@gmail.com",
    password: "password",
    password_confirmation: "password"
  }
  ])

Player.create([
  {
    player_name:"George Hill",
    player_number:"3",
    average_fpoints:"21.8",
    team:"Indiana Pacers",
    position:"G",
    age:28,
    height:"6'2",
    weight:"190",
    picture:"https://starstreet.s3.amazonaws.com/images/headshots/2017/195x270.jpg"
  },
  {
    player_name:"JJ Redick",
    player_number:"4",
    average_fpoints:"21.6",
    team:"Los Angeles Clippers",
    position:"G",
    age:29,
    height:"6'4",
    weight:"190",
    picture:"https://starstreet.s3.amazonaws.com/images/headshots/1950/195x270.jpg"
  },
  {
    player_name:"Serge Ibaka",
    player_number:"9",
    average_fpoints:"32.3",
    team:"Oklahoma City Thunder",
    position:"F",
    age:24,
    height:"6'10",
    weight:"235",
    picture:"https://starstreet.s3.amazonaws.com/images/headshots/1982/195x270.jpg"
  },
  {
    player_name:"Nene Halario",
    player_number:"42",
    average_fpoints:"27.9",
    team:"Washington Wizards",
    position:"F",
    age:31,
    height:"6'11",
    weight:"267",
    picture:"https://starstreet.s3.amazonaws.com/images/headshots/1740/195x270.jpg"
  },
  {
    player_name:"Lance Stephenson",
    player_number:"1",
    average_fpoints:"28.7",
    team:"Indiana Pacers",
    position:"G",
    age:23,
    height:"6'5",
    weight:"227",
    picture:"https://starstreet.s3.amazonaws.com/images/headshots/6295/195x270.jpg"
  },
  {
    player_name:"David West",
    player_number:"21",
    average_fpoints:"28.7",
    team:"Indiana Pacers",
    position:"F",
    age:33,
    height:"6'9",
    weight:"255",
    picture:"https://starstreet.s3.amazonaws.com/images/headshots/1917/195x270.jpg"
  },
  {
    player_name:"John Wall",
    player_number:"2",
    average_fpoints:"38.5",
    team:"Washington Wizards",
    position:"G",
    age:23,
    height:"6'4",
    weight:"212",
    picture:"https://starstreet.s3.amazonaws.com/images/headshots/2070/195x270.jpg"
  },
  {
    player_name:"Paul George",
    player_number:"24",
    average_fpoints:"37.8",
    team:"Indiana Pacers",
    position:"F",
    age:24,
    height:"6'9",
    weight:"225",
    picture:"https://starstreet.s3.amazonaws.com/images/headshots/1798/195x270.jpg"
  },
  {
    player_name:"Russell Westbrook",
    player_number:"0",
    average_fpoints:"40.8",
    team:"Oklahoma City Thunder",
    position:"PG",
    age:25,
    height:"6'3",
    weight:"200",
    picture:"https://starstreet.s3.amazonaws.com/images/headshots/1985/195x270.jpg"
  },
  {
    player_name:"Chris Paul",
    player_number:"3",
    average_fpoints:"43",
    team:"Los Angeles Clippers",
    position:"G",
    age:29,
    height:"6'",
    weight:"185",
    picture:"https://starstreet.s3.amazonaws.com/images/headshots/1912/195x270.jpg"
  },
  {
    player_name:"Trevor Ariza",
    player_number:"1",
    average_fpoints:"28.2",
    team:"Washington Wizards",
    position:"F",
    age:28,
    height:"6'8",
    weight:"210",
    picture:"https://starstreet.s3.amazonaws.com/images/headshots/1903/195x270.jpg"
  },
  {
    player_name:"DeAndre Jordan",
    player_number:"6",
    average_fpoints:"34.2",
    team:"Los Angeles Clippers",
    position:"C",
    age:25,
    height:"265",
    weight:"6'11",
    picture:"http://imagesnl.draftstreet.com/nba/players/4497.jpg"
  },
  {
    player_name:"Kevin Durant",
    player_number:"35",
    average_fpoints:"49.9",
    team:"Oklahoma City Thunder",
    position:"F",
    age:25,
    height:"6'9",
    weight:"235",
    picture:"https://starstreet.s3.amazonaws.com/images/headshots/2100/195x270.jpg"
  },
  {
    player_name:"Blake Griffin",
    player_number:"32",
    average_fpoints:"42",
    team:"Los Angeles Clippers",
    position:"F",
    age:25,
    height:"250",
    weight:"6'10",
    picture:"https://starstreet.s3.amazonaws.com/images/headshots/2102/195x270.jpg"
  },
  {
    "player_name": "Anthony Rendon",
    "player_number": "6",
    "average_fpoints": "286",
    "team": "Washington Nationals",
    "position": "2B",
    "age": 23,
    "height": "6",
    "weight": "195",
    "picture": "https://starstreet.s3.amazonaws.com/images/headshots/8124/195x270.jpg"
  },
  {
    "player_name": "Yan Gomes",
    "player_number": "10",
    "average_fpoints": "198",
    "team": "Cleveland Indians",
    "position": "C",
    "age": 26,
    "height": "6'2",
    "weight": "215",
    "picture": "https://starstreet.s3.amazonaws.com/images/headshots/6816/195x270.jpg"
  },
  {
    "player_name": "Asdrubal Cabrera",
    "player_number": "13",
    "average_fpoints": "239",
    "team": "Cleveland Indians",
    "position": "SS",
    "age": 28,
    "height": "6",
    "weight": "205",
    "picture": "https://starstreet.s3.amazonaws.com/images/headshots/2457/195x270.jpg"
  },
  {
    "player_name": "Ian Kinsler",
    "player_number": "3",
    "average_fpoints": "299",
    "team": "Detriot Tigers",
    "position": "2B",
    "age": 31,
    "height": "6",
    "weight": "200",
    "picture": "https://starstreet.s3.amazonaws.com/images/headshots/2726/195x270.jpg"
  },
  {
    "player_name": "Howie Kendrick",
    "player_number": "47",
    "average_fpoints": "322",
    "team": "Los Angeles Angels",
    "position": "2B",
    "age": 30,
    "height": "5'10",
    "weight": "205",
    "picture": "https://starstreet.s3.amazonaws.com/images/headshots/2197/195x270.jpg"
  },
  {
    "player_name": "Miguel Cabrera",
    "player_number": "24",
    "average_fpoints": "335",
    "team": "Detriot Tigers",
    "position": "1B",
    "age": 31,
    "height": "6'4",
    "weight": "240",
    "picture": "https://starstreet.s3.amazonaws.com/images/headshots/3016/195x270.jpg"
  },
  {
    "player_name": "Albert Pujols",
    "player_number": "5",
    "average_fpoints": "345",
    "team": "Los Angeles Angels",
    "position": "1B",
    "age": 34,
    "height": "6'3",
    "weight": "230",
    "picture": "https://starstreet.s3.amazonaws.com/images/headshots/2105/195x270.jpg"
  },
  {
    "player_name": "Mike Minor",
    "player_number": "36",
    "average_fpoints": "48",
    "team": "Atlanta Braves",
    "position": "SP",
    "age": 26,
    "height": "6'4",
    "weight": "205",
    "picture": "https://starstreet.s3.amazonaws.com/images/headshots/2288/195x270.jpg"
  },
  {
    "player_name": "Drew Smyly",
    "player_number": "33",
    "average_fpoints": "115",
    "team": "Detriot Tigers",
    "position": "SP",
    "age": 24,
    "height": "6'3",
    "weight": "190",
    "picture": "https://starstreet.s3.amazonaws.com/images/headshots/6495/195x270.jpg"
  },
  {
    "player_name": "Stephen Strasburg",
    "player_number": "37",
    "average_fpoints": "207",
    "team": "Washington Nationals",
    "position": "SP",
    "age": 25,
    "height": "6'4",
    "weight": "211",
    "picture": "https://starstreet.s3.amazonaws.com/images/headshots/2592/195x270.jpg"
  },
  {
    "player_name": "Garrett Richards",
    "player_number": "43",
    "average_fpoints": "205",
    "team": "Los Angeles Angels",
    "position": "SP",
    "age": 25,
    "height": "6'3",
    "weight": "215",
    "picture": "https://starstreet.s3.amazonaws.com/images/headshots/6864/195x270.jpg"
  }
  ])

Game.create([
  {
    sport: "Test Basketball",
    prizes: 500,
    buy_in: 2,
    current_entries: 0,
    allowed_entries: 100
  }])

DraftedPlayer.create ([
  {
    game_id: 1,
    player_id: 1,
    tier:0
  },
  {
    game_id: 1,
    player_id: 2,
    tier:0
  },
  {
    game_id: 1,
    player_id: 3,
    tier:1
  },
  {
    game_id: 1,
    player_id: 4,
    tier:1
  },
  {
    game_id: 1,
    player_id: 5,
    tier:2
  },
  {
    game_id: 1,
    player_id: 6,
    tier:2
  },
  {
    game_id: 1,
    player_id: 7,
    tier:3
  },
  {
    game_id: 1,
    player_id: 8,
    tier:3
  },
  {
    game_id: 1,
    player_id: 9,
    tier:4
  },
  {
    game_id: 1,
    player_id: 10,
    tier:4
  }
  ])
