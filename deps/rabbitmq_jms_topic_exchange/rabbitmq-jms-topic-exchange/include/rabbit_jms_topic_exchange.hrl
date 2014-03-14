%% The contents of this file are subject to the Mozilla Public License
%% Version 1.1 (the "License"); you may not use this file except in
%% compliance with the License. You may obtain a copy of the License
%% at http://www.mozilla.org/MPL/
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and
%% limitations under the License.
%%
%% The Original Code is RabbitMQ.
%%
%% The Initial Developer of the Original Code is Pivotal Software, Inc.
%% Copyright (c) 2012, 2013 Pivotal Software, Inc.  All rights reserved.
%% -----------------------------------------------------------------------------

%% JMS on Rabbit Topic Selector Exchange plugin definitions

%% -----------------------------------------------------------------------------

%% User-defined exchange type name
-define(X_TYPE_NAME, <<"x-jms-topic">>).

%% mnesia stuff
-define(JMS_TOPIC_TABLE, x_jms_topic_table).
-define(JMS_TOPIC_RECORD, x_jms_topic_xs).

%% Key is x_name -- the exchange name
-record(?JMS_TOPIC_RECORD, {x_name, x_selector_funs}).
%% fields:
%%  x_selector_funs
%%      a partial map (`dict`) of binding functions:
%%          dict: RoutingKey x DestName -|-> BindingSelectorFun
%%      (there is no default, but an empty map will be initially inserted)
%%      where a BindingSelectorFun has the signature:
%%          bsf : Headers -> boolean

%% Name of arg on binding used to specify selector -- string type
%%      private static final String RJMS_SELECTOR_ARG = "rjms_selector";
%% in JMS Client.
-define(RJMS_SELECTOR_ARG, <<"rjms_selector">>).

%% Name of arg on binding used to specify erlang term -- string type
%%      private static final String RJMS_COMPILED_SELECTOR_ARG = "rjms_erlang_selector";
%% in JMS Client.
-define(RJMS_COMPILED_SELECTOR_ARG, <<"rjms_erlang_selector">>).

%% Name of type info argument on exchange; used to specify SQL identifier types.
%% Constant (name of argument) defined as
%%      private static final String RJMS_TYPE_INFO_ARG = "rjms_type_info";
%% in a Java Client application.
-define(RJMS_TYPE_INFO_ARG, <<"rjms_type_info">>).
%%
