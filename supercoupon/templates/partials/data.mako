<%def name="render_data(model)">
    <%
        from datetime import datetime
        from supercoupon.time_util import epoch_ms
        from supercoupon.helpers.data import to_json
    %>

    % if model:
        % for key, value in to_json(model).items():
            % if isinstance(value, datetime):
            data-${ key }="${ epoch_ms(value) }"
            % elif value is False:
            data-${ key }="false"
            % elif value is True:
            data-${ key }="true"
            % elif not value is None:
            data-${ key }="${ value }"
            % else:
            data-${ key }="null"
            % endif
        % endfor
    % endif
</%def>