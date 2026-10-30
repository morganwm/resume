# Common tasks. Run `just` to list them.
# Set the phone number with e.g. `export RESUME_PHONE="(555) 555-5555"`.

export TYPST_FONT_PATHS := "fonts"

out := "morgan_watson-morris_resume"
phone := env("RESUME_PHONE", "")

_default:
    @just --list

# Build one variant (default: base)
build company="base":
    typst compile resume.typ {{ if company == "base" { out + ".pdf" } else { out + "_" + company + ".pdf" } }} --input company={{ company }} --input phone="{{ phone }}"

# Rebuild on every save
watch company="base":
    typst watch resume.typ {{ out }}.pdf --input company={{ company }} --input phone="{{ phone }}"

# Build every company variant listed in src/content.typ
all:
    for c in $(typst eval 'import "src/content.typ": overviews; overviews.keys().join(" ")' --format yaml); do just build "$c"; done

# Format all Typst files in place
fmt:
    typstyle -i .

# Check formatting without changing files (what CI runs)
check:
    typstyle --check .
