local jsonschema = require('tests.jsonschema')

local is_valid_cards_json = jsonschema.generate_validator({
    type = "array",
    items = {
        type = "object",
        properties = {
            q    = { type = "string" },
            a    = { type = "string" },
            meta = { type = "string" }
        },
        required = { "q", "a" },
        additionalProperties = false
    }
})

describe("cards.json", function()
    local cards

    before_each(function()
        local path = vim.fn.getcwd() .. "/cards.json"
        local f = io.open(path, "r")
        cards = vim.json.decode(f:read("*a"))
        f:close()
    end)

    it("conforms to the card schema", function()
        local ok, err = is_valid_cards_json(cards)
        assert.is_true(ok, err)
    end)

    it("is non-empty", function()
        assert.is_true(#cards > 0)
    end)
end)
