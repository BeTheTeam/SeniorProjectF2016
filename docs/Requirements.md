# Requirements

## Functional Requirements

###Create Users
    - Create user as player
    - Create user as coach
    - Create user as organizer

### Player 
- Input personal information
- View past race performance
- Analyze performance statistics
- View team membership

### Coach
- Add and manage player membership
- Record and track player progress (enter player statistics)
- Enter for event or for practice
- View team stats
- Take notes on team members

### Organizer
- Set-up mini events given a list of players from teams
- Set-up competition mini events by similar performance
- Record event results
- Add teams to event
- Add ‘mini’ events to an event
    - For track this would be long jump, 100m run, etc.
- Able to create (mini) event description
- Able to create (mini) event rules

## Nonfunctional Requirements
- Three (3) types of users:
    - Player
    - Coach
    - Organizer
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