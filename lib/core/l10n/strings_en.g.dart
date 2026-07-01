///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$landing$en landing = Translations$landing$en._(_root);
	late final Translations$note_editor$en note_editor = Translations$note_editor$en._(_root);
	late final Translations$archive$en archive = Translations$archive$en._(_root);
	late final Translations$common$en common = Translations$common$en._(_root);
}

// Path: landing
class Translations$landing$en {
	Translations$landing$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'My Notes'
	String get title => 'My Notes';

	/// en: 'Search notes...'
	String get search_hint => 'Search notes...';

	/// en: 'No notes yet. Tap + to add one!'
	String get no_notes => 'No notes yet. Tap + to add one!';

	/// en: 'Pinned'
	String get pinned => 'Pinned';

	/// en: 'Others'
	String get others => 'Others';
}

// Path: note_editor
class Translations$note_editor$en {
	Translations$note_editor$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Title'
	String get title_hint => 'Title';

	/// en: 'Start typing...'
	String get content_hint => 'Start typing...';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Discard'
	String get discard => 'Discard';

	/// en: 'Edit Note'
	String get edit_title => 'Edit Note';

	/// en: 'New Note'
	String get new_title => 'New Note';

	/// en: 'Attachments'
	String get attachments => 'Attachments';
}

// Path: archive
class Translations$archive$en {
	Translations$archive$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Archive'
	String get title => 'Archive';

	/// en: 'No archived notes.'
	String get no_archived => 'No archived notes.';
}

// Path: common
class Translations$common$en {
	Translations$common$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Archive'
	String get archive => 'Archive';

	/// en: 'Restore'
	String get restore => 'Restore';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Delete Note?'
	String get confirm_delete_title => 'Delete Note?';

	/// en: 'Are you sure you want to permanently delete this note?'
	String get confirm_delete_message => 'Are you sure you want to permanently delete this note?';

	/// en: 'Delete All Notes?'
	String get confirm_delete_all_title => 'Delete All Notes?';

	/// en: 'This will permanently delete all your notes. This action cannot be undone.'
	String get confirm_delete_all_message => 'This will permanently delete all your notes. This action cannot be undone.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'landing.title' => 'My Notes',
			'landing.search_hint' => 'Search notes...',
			'landing.no_notes' => 'No notes yet. Tap + to add one!',
			'landing.pinned' => 'Pinned',
			'landing.others' => 'Others',
			'note_editor.title_hint' => 'Title',
			'note_editor.content_hint' => 'Start typing...',
			'note_editor.save' => 'Save',
			'note_editor.discard' => 'Discard',
			'note_editor.edit_title' => 'Edit Note',
			'note_editor.new_title' => 'New Note',
			'note_editor.attachments' => 'Attachments',
			'archive.title' => 'Archive',
			'archive.no_archived' => 'No archived notes.',
			'common.delete' => 'Delete',
			'common.archive' => 'Archive',
			'common.restore' => 'Restore',
			'common.cancel' => 'Cancel',
			'common.confirm_delete_title' => 'Delete Note?',
			'common.confirm_delete_message' => 'Are you sure you want to permanently delete this note?',
			'common.confirm_delete_all_title' => 'Delete All Notes?',
			'common.confirm_delete_all_message' => 'This will permanently delete all your notes. This action cannot be undone.',
			_ => null,
		};
	}
}
