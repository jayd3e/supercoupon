<%namespace file="supercoupon:templates/layouts/style.mako" name="style_tmpl" />
<%namespace file="supercoupon:templates/layouts/app.mako" name="app_tmpl" />
<%namespace file="supercoupon:templates/layouts/header.mako" name="header_tmpl" />

<!DOCTYPE <!doctype html>
<html lang="en">
    <head>
        <title>Supercoupon</title>

        <!-- Styles -->
        ${ style_tmpl.render_style() }
    </head>
    <body class="l-base">
        ${ header_tmpl.render_header() }

        <section class="page js-page">
            <div class="container">
                ${ self.page() }
            </div>
        </section>

        ${ app_tmpl.render_app() }
    </body>
</html>