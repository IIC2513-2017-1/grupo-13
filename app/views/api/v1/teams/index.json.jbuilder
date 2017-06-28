
json.teams do
    json.array! @teams do |team|
        json.href api_v1_team_url(team)
        json.name team.name
        json.capitan team.capitan
    end
end
