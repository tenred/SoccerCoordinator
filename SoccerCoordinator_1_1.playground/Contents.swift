// Soccer Coordinator() - Project 1
// Sherief Wissa - 10/10/2016

// 10/10/2016 Version 1.0 - Initial Release
// 17/10/2016 Version 1.1 - Update


//This app will evenly divide the play list into 3 x Soccer teams.
//Players will allocated to teams to ensure experience levels are evenly distributes.
//Letters will be send to individual gaurdians with details of their team training.


// ---------> ESTABLISH COLLECTIONS AND ARRAYS <---------
// ---------> PROJECT 1 - PART 1 (Establish Collections)<---------

let player01 = ["NAME" : "Joe Smith", "HEIGHT" : "42", "EXPERIENCED" : "YES", "GAURDIANS" : "Jim and Jan Smith"]
let player02 = ["NAME" : "Jill Tanner", "HEIGHT" : "36", "EXPERIENCED" : "YES", "GAURDIANS" : "Clara Tanner"]
let player03 = ["NAME" : "Bill Bon", "HEIGHT" : "43", "EXPERIENCED" : "YES", "GAURDIANS" : "Sara and Jenny Bon"]
let player04 = ["NAME" : "Eva Gordon", "HEIGHT" : "45", "EXPERIENCED" : "NO", "GAURDIANS" : "Wendy and Mike Gordon"]
let player05 = ["NAME" : "Matt Gill", "HEIGHT" : "40", "EXPERIENCED" : "NO", "GAURDIANS" : "Charles and Sylvia Gill"]
let player06 = ["NAME" : "Kimmy Stein", "HEIGHT" : "41", "EXPERIENCED" : "NO", "GAURDIANS" : "Bill and Hillary Stein"]
let player07 = ["NAME" : "Sammy Adams", "HEIGHT" : "45", "EXPERIENCED" : "NO", "GAURDIANS" : "Jeff Adams"]
let player08 = ["NAME" : "Karl Saygan", "HEIGHT" : "42", "EXPERIENCED" : "YES", "GAURDIANS" : "Heather Bledsoe"]
let player09 = ["NAME" : "Suzane Greenberg", "HEIGHT" : "44", "EXPERIENCED" : "YES", "GAURDIANS" : "Henrietta Dumas"]
let player10 = ["NAME" : "Sal Dali", "HEIGHT" : "41", "EXPERIENCED" : "NO", "GAURDIANS" : "Gala Dali"]
let player11 = ["NAME" : "Joe Kavalier", "HEIGHT" : "39", "EXPERIENCED" : "NO", "GAURDIANS" : "Sam and Elaine Kavalier"]
let player12 = ["NAME" : "Ben Finkelstein", "HEIGHT" : "44", "EXPERIENCED" : "NO", "GAURDIANS" : "Aaron and Jill Finkelstein"]
let player13 = ["NAME" : "Diego Soto", "HEIGHT" : "41", "EXPERIENCED" : "YES", "GAURDIANS" : "Robin and Sarika Soto"]
let player14 = ["NAME" : "Chloe Alaska", "HEIGHT" : "47", "EXPERIENCED" : "NO", "GAURDIANS" : "David and Jamie Alaska"]
let player15 = ["NAME" : "Arnold Willis", "HEIGHT" : "43", "EXPERIENCED" : "NO", "GAURDIANS" : "Claire Willis"]
let player16 = ["NAME" : "Phillip Helm", "HEIGHT" : "44", "EXPERIENCED" : "YES", "GAURDIANS" : "Thomas Helm and Eva Jones"]
let player17 = ["NAME" : "Les Clay", "HEIGHT" : "42", "EXPERIENCED" : "YES", "GAURDIANS" : "Wynonna Brown"]
let player18 = ["NAME" : "Herschel Krustofski", "HEIGHT" : "45", "EXPERIENCED" : "YES", "GAURDIANS" : "Hyman and Rachel Krustofski"]

let playerList_League = [player01,player02,player03,
                      player04,player05,player06,
                      player07,player08,player09,
                      player10,player11,player12,
                      player13,player14,player15,
                      player16,player17,player18]


let trainingDetailDragons = ["TEAM" : "Dragons" , "DATE" : " March 17", "TIME": "1pm"]
let trainingDetailSharks = ["TEAM" : "Sharks" , "DATE" : " March 17", "TIME": "3pm"]
let trainingDetailRaptors = ["TEAM" : "Raptors" , "DATE" : " March 18", "TIME": "1pm"]

var teamDragonsPlayers: Array<[String: String]> = []
var teamSharksPlayers: Array<[String: String]> = []
var teamRaptorsPlayers: Array<[String: String]> = []


// ---------> ESTABLISH FUNCTIONS USED THROUGHOUT CODE <---------
// ---------> PROJECT 1 - PART 2 (Logic to iterate player data)<---------


func assignToTeam(player: Dictionary<String,String>){
    
    //Function Input Paramater is a dictionary value of individual player from playerList Collection.
    //Prior to assigning a player to a team, current player count in each team needs to be established.
    //Return values count the number of players that have the same EXPERIENCE -> Values either "YES" or "NO"
    
    let countSharks = getPlayerCount(team: teamSharksPlayers, experienced: player["EXPERIENCED"]!)
    let countDragons = getPlayerCount(team: teamDragonsPlayers, experienced: player["EXPERIENCED"]!)
    let countRaptors = getPlayerCount(team: teamRaptorsPlayers, experienced: player["EXPERIENCED"]!)
    
    // Compare getPlayerCount values.
    // Logic implies if a team has less allocated EXPERIENCED (or alternatively non-EXPERINCED) players, assign player to the lower count team.
    
    if countDragons > countSharks {
        teamSharksPlayers.append(player)
    }else {
        if countSharks > countRaptors {
            teamRaptorsPlayers.append(player)
        } else{
            teamDragonsPlayers.append(player)
            
        }
    }
}

func getPlayerCount(team: Array<Any>, experienced: String) -> Int {
    
    //getPlayerCount cycles through passed in team collections -> teamDragonsPlayers,teamSharksPlayers, teamRaptorsPlayers
    //EXPERIENCED values of either "YES" or "NO" are tallied.
    //Return value is a total count of either EXPERIENCED=YES or EXPERIENCED=NO at the team collection at that point in time.
    
    var count: Int = 0
    
    for member in team {
        let memberDetails: Dictionary<String,String> = member as! Dictionary<String, String>
        
        for player in playerList_League{
            
            if memberDetails["NAME"]! == player["NAME"]! && experienced == player["EXPERIENCED"]! {
                count = count + 1
            }
        }
    }
    return count
}


// Main for loop to circulate through playerList array and determin which team individual player us allocated to.


for player in playerList_League {
    assignToTeam(player: player)
    
}



// ---------> ESTABLISH FUNCTIONS USED THROUGHOUT CODE <---------
// ---------> PROJECT 1 - PART 3 (Send Traing information to Gaurdians)<---------


func printGaurdianLetter(team: Array<Any>, trainingDetails: Dictionary<String,String>){
    
    //Print a Gaurdian Letter
    //Function will loop through team collection based by function paramaters.
    
    for member in team {
        let memberDetails: Dictionary<String,String> = member as! Dictionary<String, String>
        
        print("")
        print("********************************************START***********************************************")
        print("Dear \(memberDetails["GAURDIANS"]!),")
        print("")
        print("Your child has been selected to play with the All-Star Soocer dreamteam: The \(trainingDetails["TEAM"]!)!")
        print("The training session will involve a lot of running and kicking and even more running. \nAll of which are awesome skills to have if you want to be a soccer player. \n")
        print("Training details are as follows;\n")
        print("PLAYER NAME: \(memberDetails["NAME"]!)")
        print("TEAM NAME: \(trainingDetails["TEAM"]!)")
        print("TRAINING DATE: \(trainingDetails["DATE"]!)")
        print("TRAINING TIME: \(trainingDetails["TIME"]!)\n")
        print("Who knows...... with enough practise, \(memberDetails["NAME"]!) could be 'bending it like Beckahm'. \n")
        print("Kind Regards,")
        print("The \(trainingDetails["TEAM"]!) \n")
        
        print("********************************************FINISH***********************************************")
    }
}

printGaurdianLetter(team: teamRaptorsPlayers, trainingDetails: trainingDetailRaptors)
printGaurdianLetter(team: teamDragonsPlayers, trainingDetails: trainingDetailDragons)
printGaurdianLetter(team: teamSharksPlayers, trainingDetails: trainingDetailSharks)


// ---------> END <---------


