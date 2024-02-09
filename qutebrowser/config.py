import dracula.draw

config.load_autoconfig()

c.url.start_pages = ["https://google.com.br"]

c.fonts.default_family = "FiraCode Nerd Font"

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 4,
        'horizontal': 6
    }
})
