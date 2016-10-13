// Soccer Coordinator() - Project 1
//Sherief Wissa - 10/10/2016

//This app will evenly divide the play list into 3 x Soccer teams.
//Players will allocated to teams to ensure experience levels are evenly distributes.
//Letters will be send to individual gaurdians with details of their team training.


// ---------> ESTABLISH COLLECTIONS AND ARRAYS <---------
// ---------> PROJECT 1 - PART 1 (Establish Collections)<---------

let playerList : [[String:String]] =
    [["NAME" : "Joe Smith", "HEIGHT" : "42", "EXPERIENCED" : "YES", "GAURDIANS" : "Jim and Jan Smith"],
     ["NAME" : "Jill Tanner", "HEIGHT" : "36", "EXPERIENCED" : "YES", "GAURDIANS" : "Clara Tanner"],
     ["NAME" : "Bill Bon", "HEIGHT" : "43", "EXPERIENCED" : "YES", "GAURDIANS" : "Sara and Jenny Bon"],
     ["NAME" : "Eva Gordon", "HEIGHT" : "45", "EXPERIENCED" : "NO", "GAURDIANS" : "Wendy and Mike Gordon"],
     ["NAME" : "Matt Gill", "HEIGHT" : "40", "EXPERIENCED" : "NO", "GAURDIANS" : "Charles and Sylvia Gill"],
     ["NAME" : "Kimmy Stein", "HEIGHT" : "41", "EXPERIENCED" : "NO", "GAURDIANS" : "Bill and Hillary Stein"],
     ["NAME" : "Sammy Adams", "HEIGHT" : "45", "EXPERIENCED" : "NO", "GAURDIANS" : "Jeff Adams"],
     ["NAME" : "Karl Saygan", "HEIGHT" : "42", "EXPERIENCED" : "YES", "GAURDIANS" : "Heather Bledsoe"],
     ["NAME" : "Suzane Greenberg", "HEIGHT" : "44", "EXPERIENCED" : "YES", "GAURDIANS" : "Henrietta Dumas"],
     ["NAME" : "Sal Dali", "HEIGHT" : "41", "EXPERIENCED" : "NO", "GAURDIANS" : "Gala Dali"],
     ["NAME" : "Joe Kavalier", "HEIGHT" : "39", "EXPERIENCED" : "NO", "GAURDIANS" : "Sam and Elaine Kavalier"],
     ["NAME" : "Ben Finkelstein", "HEIGHT" : "44", "EXPERIENCED" : "NO", "GAURDIANS" : "Aaron and Jill Finkelstein"],
     ["NAME" : "Diego Soto", "HEIGHT" : "41", "EXPERIENCED" : "YES", "GAURDIANS" : "Robin and Sarika Soto"],
     ["NAME" : "Chloe Alaska", "HEIGHT" : "47", "EXPERIENCED" : "NO", "GAURDIANS" : "David and Jamie Alaska"],
     ["NAME" : "Arnold Willis", "HEIGHT" : "43", "EXPERIENCED" : "NO", "GAURDIANS" : "Claire Willis"],
     ["NAME" : "Phillip Helm", "HEIGHT" : "44", "EXPERIENCED" : "YES", "GAURDIANS" : "Thomas Helm and Eva Jones"],
     ["NAME" : "Les Clay", "HEIGHT" : "42", "EXPERIENCED" : "YES", "GAURDIANS" : "Wynonna Brown"],
     ["NAME" : "Herschel Krustofski", "HEIGHT" : "45", "EXPERIENCED" : "YES", "GAURDIANS" : "Hyman and Rachel Krustofski"]]


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
        
        for player in playerList{
            
            if memberDetails["NAME"]! == player["NAME"]! && experienced == player["EXPERIENCED"]! {
                count = count + 1
            }
        }
    }
    return count
}


// Main for loop to circulate through playerList array and determin which team individual player us allocated to.


for player in playerList {
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
        print("Your child has been selected to shoot hoops with the All-Star dreamteam: The \(trainingDetails["TEAM"]!)!")
        print("The training session will involve a lot of running and jumping and throwing. \nAll of which are awesome skills to have if you want to be a basket player. \n")
        print("Training details are as follows;\n")
        print("PLAYER NAME: \(memberDetails["NAME"]!)")
        print("TEAM NAME: \(trainingDetails["TEAM"]!)")
        print("TRAINING DATE: \(trainingDetails["DATE"]!)")
        print("TRAINING TIME: \(trainingDetails["TIME"]!)\n")
        print("Who knows......\(memberDetails["NAME"]!) could be rippin the court with Kobe Bryant. \n")
        print("Kind Regards,")
        print("The \(trainingDetails["TEAM"]!) \n")
        
        print("********************************************FINISH***********************************************")
        
        
    }
}


printGaurdianLetter(team: teamRaptorsPlayers, trainingDetails: trainingDetailRaptors)
printGaurdianLetter(team: teamDragonsPlayers, trainingDetails: trainingDetailRaptors)
printGaurdianLetter(team: teamSharksPlayers, trainingDetails: trainingDetailSharks)

// ---------> END <---------

