# Requirements

## Functional Requirements

###Create Users
- Create user as player
- Create user as coach
- Create user as organizer
- Create user as scout

### Player 
- Input personal information
- View past race performance
- Analyze performance statistics
- View team membership
- View events for team, both past and upcoming

### Coach
- Add and manage player membership
- Record and track player progress (enter player statistics)
- Enter for event or for practice
- View team stats
- Take notes on team members
- View events for team, both past and upcoming

### Organizer
- Set-up mini events given a list of players from teams
- Set-up competition mini events by similar performance
- Record event results
- Add teams to event
- Add ‘mini’ events to an event
    - For track this would be long jump, 100m run, etc.
- Able to create (mini) event description
- Able to create (mini) event rules
- View events for team, both past and upcoming

### Scout
- View team stats
- View team membership
- View player stats on each team
- View coach notes on team players
- View events for team, both past and upcoming

## Nonfunctional Requirements
- Four (4) types of users:
    - Player
    - Coach
    - Organizer
	- Scout
- Statistics have different types (examples)
    - Time (HH:mm:ss), (mm:ss), (ss)
    - Score (numeric)
    - Hits (numeric)
    - Distance (decimal; different units allowed)
    - Coach defined stats with type assigned
- (Mini) events can use predefined rules (Event Schema)
    - Consists of rules and descriptions of a previously created event
    - Acts like a template
- Will use as a web interface
- Accessible from either desktop or mobile browsers
