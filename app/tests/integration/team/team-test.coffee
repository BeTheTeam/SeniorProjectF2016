describe "Integration: Teaming", ->
  describe "Creating Team", ->
    it "Log in successfully", ->
      @store.createRecord('player', (
          name: inputName,
          role: inputRole,
          only_player_thing: "heyyo"
        )).save()
      expect(true)