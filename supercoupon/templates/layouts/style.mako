<%def name="render_style()">
    <link class="shortcut-icon js-shortcut-icon"
          rel="shortcut icon"
          href="${ request.static_url('supercoupon:static/img/favicon.png') }" />
    % if request.registry.settings['supercoupon.mode'] == 'production':
        <link rel="stylesheet"
              type="text/css"
              href="${ request.static_url('supercoupon:static/css/screen_%s.css' % request.git_hash) }" />
    % else:
        <link rel="stylesheet"
              type="text/css"
              href="${ request.static_url('supercoupon:static/css/screen.css') }" />
    % endif
</%def>