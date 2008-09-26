#include <math.h>
#include <gtk/gtk.h>

static gboolean
expose_callback (GtkWidget *da, GdkEventExpose *event, gpointer user_data)
{
	g_print ("Expose\n");

	cairo_t *cr = gdk_cairo_create (event->window);

	/* draw a circle */
	cairo_arc (cr, 50., 50., 25, -M_PI, M_PI);
	cairo_stroke (cr);

	cairo_destroy (cr);

	return TRUE;
}

int
main (int argc, char **argv)
{
	gtk_init (&argc, &argv);

	GtkWidget *window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
	GtkWidget *da = gtk_drawing_area_new ();

	gtk_container_add (GTK_CONTAINER (window), da);

	g_signal_connect_swapped (window, "delete-event",
			G_CALLBACK (gtk_main_quit), NULL);
	g_signal_connect (da, "expose-event",
			G_CALLBACK (expose_callback), NULL);

	gtk_widget_show_all (window);

	gtk_main ();
}
