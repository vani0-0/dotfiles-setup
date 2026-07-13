local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	-- ── Imports ────────────────────────────────────────────────────────────

	-- Flutter
	s("impf", {
		t("import 'package:flutter/material.dart';"),
	}),

	-- Flutter + Riverpod (ConsumerWidget / ConsumerStatefulWidget)
	s("impcw", {
		t({
			"import 'package:flutter/material.dart';",
			"import 'package:flutter_riverpod/flutter_riverpod.dart';",
		}),
	}),

	-- Flutter Hooks
	s("imph", {
		t({
			"import 'package:flutter/material.dart';",
			"import 'package:flutter_hooks/flutter_hooks.dart';",
		}),
	}),

	-- Hooks Riverpod
	s("imphr", {
		t({
			"import 'package:flutter/material.dart';",
			"import 'package:flutter_hooks/flutter_hooks.dart';",
			"import 'package:hooks_riverpod/hooks_riverpod.dart';",
		}),
	}),

	-- Riverpod annotation (for @riverpod)
	s("imprg", {
		t({
			"import 'package:riverpod_annotation/riverpod_annotation.dart';",
			"",
			"part 'provider.g.dart';",
		}),
	}),

	-- Freezed model
	s("impmodel", {
		t({
			"import 'package:freezed_annotation/freezed_annotation.dart';",
			"",
			"part 'model.freezed.dart';",
			"part 'model.g.dart';",
		}),
	}),

	-- Freezed union/state
	s("impstate", {
		t({
			"import 'package:freezed_annotation/freezed_annotation.dart';",
			"",
			"part 'state.freezed.dart';",
		}),
	}),

	-- Dio
	s("impdio", {
		t("import 'package:dio/dio.dart';"),
	}),

	-- GoRouter
	s("impgo", {
		t("import 'package:go_router/go_router.dart';"),
	}),

	-- Intl
	s("impintl", {
		t("import 'package:intl/intl.dart';"),
	}),

	-- Collection
	s("impcol", {
		t("import 'package:collection/collection.dart';"),
	}),
	-- ── Widgets ────────────────────────────────────────────────────────────

	s("stl", {
		t("class "),
		i(1, "MyWidget"),
		t({ " extends StatelessWidget {", "\tconst " }),
		i(2, "MyWidget"),
		t({ "({super.key});", "", "\t@override", "\tWidget build(BuildContext context) {", "\t\treturn " }),
		i(3, "Container()"),
		t({ ";", "\t}", "}" }),
	}),

	s("stf", {
		t("class "),
		i(1, "MyWidget"),
		t({ " extends StatefulWidget {", "\tconst " }),
		i(2, "MyWidget"),
		t({ "({super.key});", "", "\t@override", "\tState<" }),
		i(3, "MyWidget"),
		t({ "> createState() => _" }),
		i(4, "MyWidget"),
		t({ "State();", "}", "", "class _" }),
		i(5, "MyWidget"),
		t({ "State extends State<" }),
		i(6, "MyWidget"),
		t({ "> {", "\t@override", "\tWidget build(BuildContext context) {", "\t\treturn " }),
		i(7, "Container()"),
		t({ ";", "\t}", "}" }),
	}),

	-- ── Riverpod: Widgets ──────────────────────────────────────────────────

	-- ConsumerWidget  (cwidget)
	s("cwidget", {
		t("class "),
		i(1, "MyWidget"),
		t({ " extends ConsumerWidget {", "\tconst " }),
		i(2, "MyWidget"),
		t({
			"({super.key});",
			"",
			"\t@override",
			"\tWidget build(BuildContext context, WidgetRef ref) {",
			"\t\treturn ",
		}),
		i(3, "Container()"),
		t({ ";", "\t}", "}" }),
	}),

	-- ConsumerStatefulWidget  (cswidget)
	s("cswidget", {
		t("class "),
		i(1, "MyWidget"),
		t({ " extends ConsumerStatefulWidget {", "\tconst " }),
		i(2, "MyWidget"),
		t({ "({super.key});", "", "\t@override", "\tConsumerState<" }),
		i(3, "MyWidget"),
		t({ "> createState() => _" }),
		i(4, "MyWidget"),
		t({ "State();", "}", "", "class _" }),
		i(5, "MyWidget"),
		t({ "State extends ConsumerState<" }),
		i(6, "MyWidget"),
		t({ "> {", "\t@override", "\tWidget build(BuildContext context) {", "\t\treturn " }),
		i(7, "Container()"),
		t({ ";", "\t}", "}" }),
	}),

	-- ── Riverpod: Providers (code-gen style) ───────────────────────────────

	-- Simple provider  (rprov)
	s("rprov", {
		t({ "@riverpod", "" }),
		i(1, "Type"),
		t(" "),
		i(2, "myProvider"),
		t("("),
		i(3, "MyProviderRef"),
		t({ " ref) {", "\treturn " }),
		i(4, "value"),
		t({ ";", "}" }),
	}),

	-- Async provider  (rasprov)
	s("rasprov", {
		t({ "@riverpod", "Future<" }),
		i(1, "Type"),
		t("> "),
		i(2, "myProvider"),
		t("("),
		i(3, "MyProviderRef"),
		t({ " ref) async {", "\treturn " }),
		i(4, "value"),
		t({ ";", "}" }),
	}),

	-- Notifier  (rnotif)
	s("rnotif", {
		t({ "@riverpod", "class " }),
		i(1, "MyNotifier"),
		t(" extends _$"),
		i(2, "MyNotifier"),
		t({ " {", "\t@override", "\t" }),
		i(3, "Type"),
		t({ " build() {", "\t\treturn " }),
		i(4, "initialValue"),
		t({ ";", "\t}", "}" }),
	}),

	-- AsyncNotifier  (rasnotif)
	s("rasnotif", {
		t({ "@riverpod", "class " }),
		i(1, "MyNotifier"),
		t(" extends _$"),
		i(2, "MyNotifier"),
		t({ " {", "\t@override", "\tFuture<" }),
		i(3, "Type"),
		t({ "> build() async {", "\t\treturn " }),
		i(4, "value"),
		t({ ";", "\t}", "}" }),
	}),

	-- ── Riverpod: ref helpers ──────────────────────────────────────────────

	-- ref.watch  (rw)
	s("rw", {
		t("ref.watch("),
		i(1, "provider"),
		t(")"),
	}),

	-- ref.read notifier  (rr)
	s("rr", {
		t("ref.read("),
		i(1, "provider"),
		t(".notifier)"),
	}),

	-- AsyncValue.when  (awhen)
	s("awhen", {
		t("ref.watch("),
		i(1, "provider"),
		t({ ").when(", "\tdata: (data) => " }),
		i(2, "Widget"),
		t({ ",", "\terror: (error, stack) => " }),
		i(3, "Text(error.toString())"),
		t({ ",", "\tloading: () => const CircularProgressIndicator(),", ")" }),
	}),

	-- ── Freezed ────────────────────────────────────────────────────────────

	-- Freezed data class  (frdata)
	s("frdata", {
		t({ "@freezed", "class " }),
		i(1, "MyModel"),
		t(" with _$"),
		i(2, "MyModel"),
		t({ " {", "\tconst factory " }),
		i(3, "MyModel"),
		t({ "({", "\t\trequired " }),
		i(4, "String"),
		t(" "),
		i(5, "id"),
		t({ ",", "\t}) = _" }),
		i(6, "MyModel"),
		t({ ";", "", "\tfactory " }),
		i(7, "MyModel"),
		t(".fromJson(Map<String, dynamic> json) => _$"),
		i(8, "MyModel"),
		t({ "FromJson(json);", "}" }),
	}),

	-- Freezed union / sealed class  (frunion)
	s("frunion", {
		t({ "@freezed", "sealed class " }),
		i(1, "MyState"),
		t(" with _$"),
		i(2, "MyState"),
		t({ " {", "\tconst factory " }),
		i(3, "MyState"),
		t({ ".initial() = _Initial;", "\tconst factory " }),
		i(4, "MyState"),
		t({ ".loading() = _Loading;", "\tconst factory " }),
		i(5, "MyState"),
		t(".data("),
		i(6, "String"),
		t({ " value) = _Data;", "\tconst factory " }),
		i(7, "MyState"),
		t({ ".error(String message) = _Error;", "}" }),
	}),

	-- ── Misc ───────────────────────────────────────────────────────────────

	s("pr", {
		t("print("),
		i(1, ""),
		t(")"),
	}),

	s("sf", {
		t('"${'),
		i(1, ""),
		t('}"'),
	}),
}
