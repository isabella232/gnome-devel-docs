//An AboutDialog example using Gtk.Application 

/*** You need to be running Gtk3.4 or later for this to work ***/

//A window in the application
public class Window : Gtk.ApplicationWindow {
	public Window (Application app) {
		Object (application: app, title: "AboutDialog Example");
		set_default_size (400, 200);
		var button = new Gtk.Button.with_label ("About");
		button.clicked.connect (about_clicked);
		add (button);

		show_all ();
	}

	void about_clicked () {
		string[] authors = { "GNOME Documentation Team", null };
		string[] documenters = {"GNOME Documentation Team", null };

		Gtk.show_about_dialog (this,
	                       "program-name", ("AboutDialog Example"),
	                       "copyright", ("Copyright \xc2\xa9 2012 GNOME Documentation Team"),
	                       "authors", authors,
	                       "documenters", documenters,
	                       "website", "http://developer.gnome.org",
	                       "website-label", ("GNOME Developer Website"),
	                       null);
	}
}

//This is the Application
public class Application : Gtk.Application {
	protected override void activate () {
		new Window (this);
	}

	public Application () {
		Object (application_id: "org.example.application");
	}
}

//main function creates Application and runs it
int main (string[] args) {
	return new Application ().run (args);
}

