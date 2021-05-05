//
//  MissionView.swift
//  Moonshot
//
//  Created by Alan Silva on 05/05/21.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let astronauts: [CrewMember]
    
    var body: some View {
        
        GeometryReader { geo in
            
            ScrollView(.vertical) {
                
                VStack {
                    
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.7)
                        .padding(.top)
                    
                    Text(self.mission.description)
                        .padding()
                        .layoutPriority(1)
                    
                    ForEach(self.astronauts, id: \.role) { crewMember in
                        
                        NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)) {
                            
                            HStack {
                                
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 83, height: 60)
                                    .clipShape(Capsule())
                                    .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                            }
                            
                            .padding(.horizontal)
                            
                        }
                        
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                    
                    Spacer(minLength: 25)
                    
                }
                
            }
            
        }
        
        .navigationBarTitle(Text(mission.displayName),displayMode: .inline)
        
    }
    
    init(mission: Mission, astronauts: [Astronaut]) {
        
        self.mission = mission
        
        var matches = [CrewMember]()
        
        for member in mission.crew {
            
            if let memberName = astronauts.first(where: { $0.id == member.name }) {
                
                let member = CrewMember(role: member.role, astronaut: memberName)
                matches.append(member)
                
            } else {
                
                fatalError("Missing \(member)")
                
            }
            
        }
        
        self.astronauts = matches
        
    }
    
}

struct MissionView_Previews: PreviewProvider {
    
    static let mission: [Mission] = Bundle.main.decode("missions")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts")
    
    static var previews: some View {
        MissionView(mission: mission[1], astronauts: astronauts)
    }
}
