return {
        {'L3MON4D3/LuaSnip',
        config = function()

          --lua snippets
          local ls = require "luasnip"
          local t = ls.text_node
          local i = ls.insert_node
          local s = ls.snippet

          ls.config.set_config {
            history = true
          }

          ls.add_snippets("sql", {
              s("function", {
                  t("-- "), i(1,"A short description of the function"),
                  t({"","CREATE OR REPLACE FUNCTION FN_"}), i(2,"fname"), t("( "), i(3, "param_name TYPE"), t(" )"), 
                  t(" RETURN "), i(4, "TYPE"), t(" IS"),
                  t({"", "-- variable declarations", ""}),
                  t({"BEGIN", ""}), 
                  t("-- function body"),
                  t({"" ,"RETURN "}), t("TRUE"), t(" ;"),
                  t({"","END ;"})
                }),
              s("procedure", {
                  t("-- "), i(1,"A short description of the procedure"),
                  t({"","CREATE OR REPLACE PROCEDURE PROC_"}), i(2,"procedure_name"), t("( "), i(3, "param_name TYPE"), t(" )"), t(" IS"),
                  t({"", "-- variable declarations", ""}),
                  t({"BEGIN", ""}), 
                  t("-- procedure body"),
                  t({"", "DBMS_OUTPUT.PUT_LINE('+++++++++++++') ;"}),
                  t({"","END ;", ""})
                }),
              s("anonym", {
                  t("-- "), i(1,"A short description of the anonymous block"),
                  t({"","SET SERVEROUTPUT ON ;"}),
                  t({"","DECLARE"}),
                  t({"", "-- variable declarations", ""}),
                  t({"BEGIN", ""}), 
                  t("-- anonymous function body"),
                  t({"", "DBMS_OUTPUT.PUT_LINE('+++++++++++++') ;"}),
                  t({"","END ;", ""})
                }),
              s("cursor", {
                  t("-- "), i(1,"A short description of the cursor"),
                  t({"","CURSOR cur_"}), i(2,"cursor_name"), i(3, "(param_name TYPE)"), t(" IS"),
                  t({"", "  SELECT "}), i(4, "*"), t(" FROM "), i(5, "table_name"), t(" ;")
                })
      })
            
          -- is my expansion key
          vim.keymap.set({ "i", "s" }, "<C-e>", function()
            if ls.expand_or_jumpable() then
              ls.expand_or_jump()
            end
          end, { silent = true })
          -- is my jump forward keymap
          vim.keymap.set({ "i", "s" }, "<C-o>", function()
            if ls.jumpable(-1) then
              ls.jump(-1)
            end
          end, { silent = true })

        end
      },
}
