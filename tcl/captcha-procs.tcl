ad_library {
    A captcha implementation for the template system.

    @author Antonio Pisano
}

namespace eval captcha {}
namespace eval captcha::image {}

ad_proc -private captcha::image::text_to_ascii_art {
    -text:required
    {-render_type ""}
} {
    Convert a text into ASCII art

    The art itself has been copied from the Fossil implementation.

    @see https://fossil-scm.org/home/file?name=src/captcha.c
} {
    set ascii_variants \
        [dict create \
             0 \
             [dict create \
                  0 \
                  [list \
                       "  __  " \
                       " /  \\ " \
                       "| () |" \
                       " \\__/ " \
                      ] \
                  1 \
                  [list \
                       " _ " \
                       "/ |" \
                       "| |" \
                       "|_|" \
                      ] \
                  2 \
                  [list \
                       " ___ " \
                       "|_  )" \
                       " / / " \
                       "/___|" \
                      ] \
                  3 \
                  [list \
                       " ____" \
                       "|__ /" \
                       " |_ \\" \
                       "|___/" \
                      ] \
                  4 \
                  [list \
                       " _ _  " \
                       "| | | " \
                       "|_  _|" \
                       "  |_| " \
                      ] \
                  5 \
                  [list \
                       " ___ " \
                       "| __|" \
                       "|__ \\" \
                       "|___/" \
                      ] \
                  6 \
                  [list \
                       "  __ " \
                       " / / " \
                       "/ _ \\" \
                       "\\___/"\
                      ] \
                  7 \
                  [list \
                       " ____ " \
                       "|__  |" \
                       "  / / " \
                       " /_/  " \
                      ] \
                  8 \
                  [list \
                       " ___ " \
                       "( _ )" \
                       "/ _ \\" \
                       "\\___/" \
                      ] \
                  9 \
                  [list \
                       " ___ " \
                       "/ _ \\" \
                       "\\_ \ /" \
                       " /_/ " \
                      ] \
                  A \
                  [list \
                       "      " \
                       "  /\\  " \
                       " /  \\ " \
                       "/_/\\_\\" \
                      ] \
                  B \
                  [list \
                       " ___ " \
                       "| _ )" \
                       "| _ \\" \
                       "|___/" \
                      ] \
                  C \
                  [list \
                       "  ___ " \
                       " / __|" \
                       "| (__ " \
                       " \\___|" \
                      ] \
                  D \
                  [list \
                       " ___  " \
                       "|   \\ " \
                       "| |) |" \
                       "|___/ " \
                      ] \
                  E \
                  [list \
                       " ___ " \
                       "| __|" \
                       "| _| " \
                       "|___|" \
                      ] \
                  F \
                  [list \
                       " ___ " \
                       "| __|" \
                       "| _| " \
                       "|_|  " \
                      ]
             ]\
             1 \
             [dict create \
                  0 \
                  [list \
                       "  ___  " \
                       " / _ \\ " \
                       "| | | |" \
                       "| | | |" \
                       "| |_| |" \
                       " \\___/ " \
                      ] \
                  1 \
                  [list \
                       " __ " \
                       "/_ |" \
                       " | |" \
                       " | |" \
                       " | |" \
                       " |_|" \
                      ] \
                  2 \
                  [list \
                       " ___  " \
                       "|__ \\ " \
                       "   ) |" \
                       "  / / " \
                       " / /_ " \
                       "|____|" \
                      ] \
                  3 \
                  [list \
                       " ____  " \
                       "|___ \\ " \
                       "  __) |" \
                       " |__ < " \
                       " ___) |" \
                       "|____/ " \
                      ] \
                  4 \
                  [list \
                       " _  _   " \
                       "| || |  " \
                       "| || |_ " \
                       "|__   _|" \
                       "   | |  " \
                       "   |_|  " \
                      ] \
                  5 \
                  [list \
                       " _____ " \
                       "| ____|" \
                       "| |__  " \
                       "|___ \\ " \
                       " ___) |" \
                       "|____/ " \
                      ] \
                  6 \
                  [list \
                       "   __  " \
                       "  / /  " \
                       " / /_  " \
                       "| '_ \\ " \
                       "| (_) |" \
                       " \\___/ " \
                      ] \
                  7 \
                  [list \
                       " ______ " \
                       "|____  |" \
                       "    / / " \
                       "   / /  " \
                       "  / /   " \
                       " /_/    " \
                      ] \
                  8 \
                  [list \
                       "  ___  " \
                       " / _ \\ " \
                       "| (_) |" \
                       " > _ < " \
                       "| (_) |" \
                       " \\___/ " \
                      ] \
                  9 \
                  [list \
                       "  ___  " \
                       " / _ \\ " \
                       "| (_) |" \
                       " \\__ \ |" \
                       "   / / " \
                       "  /_/  " \
                      ] \
                  A \
                  [list \
                       "          " \
                       "    /\\    " \
                       "   /  \\   " \
                       "  / /\\ \\  " \
                       " / ____ \\ " \
                       "/_/    \\_\\" \
                      ] \
                  B \
                  [list \
                       " ____  " \
                       "|  _ \\ " \
                       "| |_) |" \
                       "|  _ < " \
                       "| |_) |" \
                       "|____/ " \
                      ] \
                  C \
                  [list \
                       "  _____ " \
                       " / ____|" \
                       "| |     " \
                       "| |     " \
                       "| |____ " \
                       " \\_____|" \
                      ] \
                  D \
                  [list \
                       " _____  " \
                       "|  __ \\ " \
                       "| |  | |" \
                       "| |  | |" \
                       "| |__| |" \
                       "|_____/ " \
                      ] \
                  E \
                  [list \
                       " ______ " \
                       "|  ____|" \
                       "| |__   " \
                       "|  __|  " \
                       "| |____ " \
                       "|______|" \
                      ] \
                  F \
                  [list \
                       " ______ " \
                       "|  ____|" \
                       "| |__   " \
                       "|  __|  " \
                       "| |     " \
                       "|_|     " \
                      ] \
                 ] \
            ]

    #
    # Choose which version of the art we want to use
    #
    if {$render_type ni {1 0}} {
        set render_type [expr {int(round(rand()))}]
    }

    #
    # Compute line-by-line the rendering of the whole string.
    #
    set render_size [llength [dict get $ascii_variants $render_type 0]]

    set ascii_art ""
    for {set i 0} {$i < $render_size} {incr i} {
        for {set j 0} {$j < [string length $text]} {incr j} {
            append ascii_art [lindex \
                                  [dict get $ascii_variants $render_type \
                                       [string index $text $j] \
                                      ] \
                                  $i]
        }
        append ascii_art \n
    }

    return $ascii_art
}

ad_proc -private captcha::image::generate {
    {-background "#ffffff"}
    {-fill "#000000"}
} {
    Creates a capcha image of random text.

    @param background the background color, as RGB 6 characters code.
    @param fill the font color, background the background color, as
                RGB 6 characters code.
} {
    if {![regexp -nocase {^(\#([0-9]|[a-f]){6}){2}$} ${background}${fill}]} {
        error {Invalid color}
    }

    set text [ad_generate_random_string 8]
    set captcha_text [captcha::image::text_to_ascii_art -text $text]

    set lines [split $captcha_text \n]

    set i 0
    set max_length 0
    foreach line $lines {
        #
        # First line starts at y=0, while subsequent are "1.2
        # font-size" below.
        #
        set y [expr {$i == 0 ? "y=\"0\"" : "dy=\"1.2em\""}]
        append svg [subst {
            <tspan x="0" $y>[ns_quotehtml ${line}]</tspan>
        }]
        if {[string length $line] > $max_length} {
            set max_length [string length $line]
        }
        incr i
    }

    #
    # Empirical formula to compute the optimal length, found to work
    # in practice.
    #
    set svg_width [expr {11 * $max_length}]

    set svg_height [expr {15 * [llength $lines]}]

    set svg [subst -nocommands {
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <svg viewBox="0 0 ${svg_width} ${svg_height}"
             style="font-family: monospace">
           <rect x="0" y="0" width="100%" height="100%" fill="$background"/>
           <text xml:space="preserve" x="50%" y="50%" stroke="$fill">$svg</text>
        </svg>
    }]

    set wfd [ad_opentmpfile path .svg]
    puts -nonewline $wfd [string trim $svg]
    close $wfd

    set checksum [ns_md file -digest sha1 $path]

    return [list \
                text $text \
                path $path \
                checksum $checksum]
}

namespace eval template {}
namespace eval template::widget {}

ad_proc -public template::widget::captcha {
    element_reference
    tag_attributes
} {
    Generate a captcha text widget. This widget will display a captcha
    image containing a text. On validation, the value supplied by the
    user must match the value in the captcha.

    @param element_reference Reference variable to the form element
    @param tag_attributes HTML attributes to add to the tag

    @return Form HTML for widget
} {
    if {![ns_conn isconnected]} {
        return
    }

    upvar $element_reference element

    if {[info exists element(background)]} {
        set background $element(background)
    } else {
        set background #ffffff
    }
    if {[info exists element(fill)]} {
        set fill $element(fill)
    } else {
        set fill #000000
    }

    set captcha [captcha::image::generate \
                     -background $background \
                     -fill $fill]

    set checksum [dict get $captcha checksum]
    set text [dict get $captcha text]

    # The capcha image we are injecting directly into the page to not
    # clutter the filesystem and mess around with request processor.
    set captcha_path [dict get $captcha path]
    set rfd [open $captcha_path r]
    set svg [read $rfd]
    ::file delete -- $captcha_path
    close $rfd

    if {[info exists element(expire)]} {
        set expiration $element(expire)
    } else {
        set expiration 3600
    }
    # Store the checksum in the database together with the text we
    # expect. While we do this, we also take care of cleaning up
    # expired captchas.
    db_dml store_captcha {
        with
        cleanup as (
            delete from template_widget_captchas
            where image_checksum = :checksum
               or expiration < current_timestamp
        )
        insert into template_widget_captchas
        (image_checksum, text, expiration)
        values
        (:checksum,
         :text,
         current_timestamp + cast(:expiration || ' seconds' as interval)
         )
    }

    set captcha_checksum_id $element(form_id):$element(name):image_checksum
    return [subst {
        <input type="hidden"
               id="$captcha_checksum_id"
               name="$captcha_checksum_id"
               value="$checksum">
        <div width="100%">$svg</div>
        <div>[input text element $tag_attributes]</div>
    }]
}

namespace eval template::data {}
namespace eval template::data::validate {}

ad_proc -public template::data::validate::captcha {
    value_ref
    message_ref
} {
    Validate the captcha widget by matching the image checksum against
    the text that was supplied by the user.

    @param value_ref Reference variable to the submitted value.
    @param message_ref Reference variable for returning an error
                       message.

    @return True (1) if valid, false (0) if not.
} {
    if {![ns_conn isconnected]} {
        return 1
    }

    upvar 2 \
        $message_ref message \
        $value_ref value \
        element element

    set checksum [ns_queryget $element(form_id):$element(name):image_checksum]
    if {$checksum ne ""} {
        # While we check for this particular captcha, we also sloppily
        # cleanup the ones that have already expired.
        set valid_p [db_0or1row check_captcha {
            with
            lookup as (
               select text, image_checksum
                 from template_widget_captchas
                where image_checksum = :checksum
            ),
            cleanup as (
                delete from template_widget_captchas
                where image_checksum = (select image_checksum from lookup)
                   or expiration < current_timestamp
            )
            select 1 from lookup where text = :value
        }]
    } else {
        set valid_p 0
    }

    if {!$valid_p} {
        set message [_ captcha.Your_captcha_is_invalid]
    }

    return $valid_p
}
