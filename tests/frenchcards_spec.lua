-- tests/frenchcards_spec.lua
-- Run with: nvim --headless -u tests/minimal_init.lua -c "PlenaryBustedDirectory tests/ {minimal_init = 'tests/minimal_init.lua'}"
-- or:       make test

local fc = require("frenchcards")

describe("frenchcards", function()

    -- ── card data ────────────────────────────────────────────────────────────

    describe("cards table", function()
        it("is non-empty", function()
            assert.is_true(#fc.cards > 0)
        end)

        it("every card has a non-empty q and a", function()
            for i, card in ipairs(fc.cards) do
                assert.is_string(card.q, "card " .. i .. " q is not a string")
                assert.is_string(card.a, "card " .. i .. " a is not a string")
                assert.is_true(#card.q > 0, "card " .. i .. " q is empty")
                assert.is_true(#card.a > 0, "card " .. i .. " a is empty")
            end
        end)

        it("meta field is either nil or a string", function()
            for i, card in ipairs(fc.cards) do
                if card.meta ~= nil then
                    assert.is_string(card.meta, "card " .. i .. " meta is not a string")
                end
            end
        end)
    end)

    -- ── trim ─────────────────────────────────────────────────────────────────

    describe("trim()", function()
        it("strips leading spaces", function()
            assert.are.equal("hello", fc.trim("   hello"))
        end)

        it("strips trailing spaces", function()
            assert.are.equal("hello", fc.trim("hello   "))
        end)

        it("strips surrounding whitespace including tabs and newlines", function()
            assert.are.equal("hello world", fc.trim("\t hello world \n"))
        end)

        it("returns an empty string unchanged", function()
            assert.are.equal("", fc.trim(""))
        end)

        it("returns a string with only spaces as empty", function()
            assert.are.equal("", fc.trim("   "))
        end)

        it("leaves inner whitespace intact", function()
            assert.are.equal("Je suis", fc.trim("  Je suis  "))
        end)
    end)

    -- ── is_correct ───────────────────────────────────────────────────────────

    describe("is_correct()", function()
        it("returns true for an exact match", function()
            assert.is_true(fc.is_correct("Je suis", "Je suis"))
        end)

        it("is case-insensitive", function()
            assert.is_true(fc.is_correct("je suis", "Je suis"))
            assert.is_true(fc.is_correct("JE SUIS", "Je suis"))
        end)

        it("trims whitespace before comparing", function()
            assert.is_true(fc.is_correct("  Je suis  ", "Je suis"))
        end)

        it("returns false for a wrong answer", function()
            assert.is_false(fc.is_correct("Je vais", "Je suis"))
        end)

        it("returns false for an empty answer", function()
            assert.is_false(fc.is_correct("", "Je suis"))
        end)

        it("handles accented characters correctly", function()
            assert.is_true(fc.is_correct("J'étais", "J'étais"))
        end)

        it("returns false when accents differ", function()
            assert.is_false(fc.is_correct("J'etais", "J'étais"))
        end)
    end)

    -- ── pick_card ────────────────────────────────────────────────────────────

    describe("pick_card()", function()
        it("returns a table with q and a fields", function()
            local card = fc.pick_card()
            assert.is_string(card.q)
            assert.is_string(card.a)
        end)

        it("returns the card unflipped when rng_float <= 0.5", function()
            -- Force index 1, no flip
            local card = fc.pick_card(function() return 0.3 end, function(_) return 1 end)
            assert.are.equal(fc.cards[1].q, card.q)
            assert.are.equal(fc.cards[1].a, card.a)
        end)

        it("returns the card flipped when rng_float > 0.5", function()
            -- Force index 1, flip
            local card = fc.pick_card(function() return 0.9 end, function(_) return 1 end)
            assert.are.equal(fc.cards[1].a, card.q)
            assert.are.equal(fc.cards[1].q, card.a)
        end)

        it("preserves meta on the picked card", function()
            -- Find a card that has meta
            local idx = nil
            for i, c in ipairs(fc.cards) do
                if c.meta then idx = i; break end
            end
            assert.is_not_nil(idx, "No card with meta found in card list")
            local card = fc.pick_card(function() return 0.1 end, function(_) return idx end)
            assert.are.equal(fc.cards[idx].meta, card.meta)
        end)

        it("picks different cards across calls (statistical)", function()
            local seen = {}
            for _ = 1, 50 do
                local c = fc.pick_card()
                seen[c.q] = true
            end
            assert.is_true(#vim.tbl_keys(seen) > 1, "Expected multiple distinct cards over 50 calls")
        end)
    end)

    -- ── card_lines ───────────────────────────────────────────────────────────

    describe("card_lines()", function()
        it("returns a table of strings", function()
            local lines = fc.card_lines({ q = "I am", a = "Je suis" })
            assert.is_table(lines)
            for _, l in ipairs(lines) do
                assert.is_string(l)
            end
        end)

        it("includes the question text", function()
            local lines = fc.card_lines({ q = "I am", a = "Je suis" })
            assert.is_true(vim.tbl_contains(lines, "I am"))
        end)

        it("includes an empty meta line when meta is nil", function()
            local lines = fc.card_lines({ q = "I am", a = "Je suis" })
            assert.is_true(vim.tbl_contains(lines, ""))
        end)

        it("includes a bracketed meta line when meta is provided", function()
            local lines = fc.card_lines({ q = "I am", a = "Je suis", meta = "informal" })
            assert.is_true(vim.tbl_contains(lines, "[informal]"))
        end)

        it("ends with an empty line (answer input area)", function()
            local lines = fc.card_lines({ q = "I am", a = "Je suis" })
            assert.are.equal("", lines[#lines])
        end)
    end)

end)
