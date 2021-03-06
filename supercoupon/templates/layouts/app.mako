<%namespace file="redd:templates/partials/data.mako" name="data_tmpl" />

<%def name="render_app()">
    <!-- Dependencies -->
    ${ scripts(['supercoupon:static/js/libs/jquery-2.1.1.js',
                'supercoupon:static/js/libs/underscore-1.7.0.js',
                'supercoupon:static/js/libs/backbone-1.1.2.js']) }

    <!-- App -->
    ${ scripts(['supercoupon:static/js/supercoupon.js']) }
</%def>

<%def name="scripts(script_paths)">
    % for script_path in script_paths:
    <script type="text/javascript" charset="utf-8" src="${ request.static_url(script_path) }"></script>
    % endfor
</%def>