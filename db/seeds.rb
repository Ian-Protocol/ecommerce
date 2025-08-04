# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Idempotency
OrderItem.destroy_all
Order.destroy_all
CartItem.destroy_all
Cart.destroy_all
Address.destroy_all
User.destroy_all
Categorization.destroy_all
Product.destroy_all
Category.destroy_all
Province.destroy_all

# Seed the provinces
# https://www.canada.ca/en/revenue-agency/services/tax/businesses/topics/gst-hst-businesses/charge-collect-which-rate/calculator.html
provinces = [
  { name: 'Alberta', code: 'AB', gst: 0.05, pst: 0.0 },
  { name: 'British Columbia', code: 'BC', gst: 0.05, pst: 0.07 },
  { name: 'Manitoba', code: 'MB', gst: 0.05, pst: 0.07 },
  { name: 'New Brunswick', code: 'NB', gst: 0.15, pst: 0.0 },
  { name: 'Newfoundland and Labrador', code: 'NL', gst: 0.15, pst: 0.0 },
  { name: 'Northwest Territories', code: 'NT', gst: 0.05, pst: 0.0 },
  { name: 'Nova Scotia', code: 'NS', gst: 0.14, pst: 0.0 },
  { name: 'Nunavut', code: 'NU', gst: 0.05, pst: 0.0 },
  { name: 'Ontario', code: 'ON', gst: 0.13, pst: 0.0 },
  { name: 'Quebec', code: 'QC', gst: 0.05, pst: 0.09975 },
  { name: 'Prince Edward Island', code: 'PE', gst: 0.15, pst: 0.0 },
  { name: 'Saskatchewan', code: 'SK', gst: 0.05, pst: 0.06 },
  { name: 'Yukon', code: 'YT', gst: 0.05, pst: 0.0 }
]

provinces.each do |province|
  Province.create!(province)
end

# Seed the categories
categories = [
  "Single Board Computers",
  "Power Supplies",
  "Cases",
  "Keyboards",
  "Cooling",
  "Kits",
  "Expansions"
]

categories.each do |name|
  Category.create!(name: name)
end

# Seed the products
products = [
    {
        name: "Lattepanda 3 Delta",
        description: "High Performance N5105 Mini PC: Featuring an an Intel Celeron N5105 processor with speeds up to 2.9GHz, this mini PC offers significantly improved performance. 8GB RAM+64GB eMMC: This pocket-sized, hackable x86 single board computer measures just 125 x 78 x 16mm and is equipped with 8GB of high-bandwidth RAM and 64GB eMMC for smooth multitasking and fast storage in a compact form factor. Multiple OS Support: The LattePanda 3 Delta mini PC is compatible with Windows (Win 10 and Win 11) and Linux OS. Ultra-Fast Connectivity and Data Transfer: The Mini Desktop Computer has Wi-Fi 6 and Gigabit Ethernet for quick streaming and downloading. It also has USB3.2 gen2, USB 3.2 gen1, and USB Type C ports for speeds up to 10X faster than USB2.0. WSuperb Flexibility and Compatibility: This Single Board Computer supports Dual 4K HDR and 3-way video output, including HDMI, Display port over USB-C, and eDP. It also features rich IOs and an integrated Arduino Coprocessor ATmega32U4, compatible with 200+ sensors and actuators.",
        price: 649.99,
        stock_quantity: 6
    },
    { 
        name: "OrangePi 5 Ultra",
        description: "OrangePi 5 Ultra uses Rockchip RK3588 8-core 64-bit processor with 4 Cortex-A76 (2.4GHz), 4 Cortex-A55 (1.8GHz) and independent NEON coprocessor. Adopting 8nm process design, the main frequency is up to 2.4GHz, integrated ARM Mali-G610, built-in 3D GPU, compatible with OpenGL ES1.1/2.0/3.2, OpenCL 2.2, and Vulkan 1.2; the embedded NPU supports INT4/INT8/INT16/FP16 hybrid computing, with up to 6TOPS of computing power, which can meet the edge computing needs of most terminal devices; it has 4GB/8GB/16GB LPDDR5, with up to 8K display processing capability, supports eMMC flash socket and eMMC IC (either one ), and has Wi-Fi 6E+BT 5.3 with BLE support. OrangePi 5 Ultra provides abundant interfaces, including HDMI output, HDMI in, GPIO interface, USB2.0, USB3.0, 3.5mm headphone socket, one PCIe extended 2.5G high-speed network port, one M.2 M-Key slot (PCIe 3.0 4-Lane), supporting for the installation of NVMe SSDs or SATA SSDs. OrangePi 5 Ultra is compact, measuring only 89mmX57mmX1.6mm, and powerful enough to be widely used in high-end tablets, edge computing, artificial intelligence, cloud computing, AR/VR, smart security, smart home, etc., covering various industries of AIoT. OrangePi 5 Ultra supports Orange Pi OS, the official operating system developed by Orange Pi, as well as Ubuntu, Android 13, Debian and other operating systems.",
        price: 239.99,
        stock_quantity: 14
    },
    { 
        name: 'Pimoroni Inventor HAT Mini',
        description: "A versatile motor, servo and audio driver HAT for Raspberry Pi. Bring your mechanical inventions, creations and contraptions to life! Inventor HAT Mini helps transform a Raspberry Pi computer into a robot, prop, kinetic sculpture, creepy automaton or other exciting moving thing. Want to drive a couple of fancy motors with encoders (or hook up standard motors with jumper wires)? Yep! Add up to four servos? Sure? Attach a little speaker so you can make noise? No problem! It's expandable too, with a pass-through header for stacking with other boards and four extra ADC-capable GPIO pins - you could use these to attach analog or digital sensors, or more buttons and LEDs. Speaking of LEDs, we've also managed to fit in 8 addressable RGB LEDs (AKA Neopixels) - that's one for each servo and GPIO/ADC channel so you can use them as indicators. We wanted Inventor HAT Mini to be fast and easy to get started with, so we've equipped it with convenient pre-soldered pin headers, a Qw/ST connector for plugging in breakouts and a fully featured Python library with plenty of helpful examples. For power users, we've added an unpopulated external power input and the ability to use higher voltage motors and servos (up to 10V). Inventor HAT Mini is compatible with all Raspberry Pi computers with a 40 pin header attached. Mini HATs fit especially neatly on top of Raspberry Pi Zero boards, though.",
        price: 24.99,
        stock_quantity: 12
    },
    { 
        name: "Raspberry Pi 3 Model B+",
        description: "The Raspberry Pi 3 Model B+ is the latest product in the Raspberry Pi 3 range, boasting a 64-bit quad core processor running at 1.4GHz, dual-band 2.4GHz and 5GHz wireless LAN, Bluetooth 4.2/BLE, faster Ethernet, and PoE capability via a separate PoE HAT. The dual-band wireless LAN comes with modular compliance certification, allowing the board to be designed into end products with significantly reduced wireless LAN compliance testing, improving both cost and time to market. The Raspberry Pi 3 Model B+ maintains the same mechanical footprint as both the Raspberry Pi 2 Model B and the Raspberry Pi 3 Model B.",
        price: 49.99,
        stock_quantity: 4
    },
    { 
        name: "3 Model B Aluminum Alloy Case",
        description: "Raspberry Pi 3 Model B Aluminum Alloy Case. Passive Cooling Shell. Metal Enclosure for Heat Dissipation. For Raspberry Pi 3B/3B+.",
        price: 39.99,
        stock_quantity: 7
    },
    { 
        name: "Raspberry Pi 4 Model B 8GB Starter MAX Kit",
        description: "Raspberry Pi 4 Model B 8GB. HighPi Pro case for Raspberry Pi 4. HighPi Pro 5V Cooling Fan. USB-C Power Supply, 5.1V 3.0A, Black, UL Listed. Class 10 microSD Card With Raspberry Pi OS (Raspbian) - 32GB. HDMI A male to Micro D male cable, 3ft. USB card reader for microSD cards. Aluminum Heatsink for Raspberry Pi 4B (3-Pack).",
        price: 239.99,
        stock_quantity: 3
    },
    { 
        name: "Raspberry Pi 5 16GB",
        description: "Featuring a 64-bit quad-core Arm Cortex-A76 processor running at 2.4GHz, Raspberry Pi 5 delivers a 2 ~ 3x increase in CPU performance relative to the last gen Raspberry Pi 4. Alongside a substantial uplift in graphics performance from an 800MHz VideoCore VII GPU; dual 4Kp60 display outputs over HDMI; and state-of-the-art camera support from a rearchitected Raspberry Pi Image Signal Processor, it provides a smooth desktop experience for consumers, and opens the door to new applications for industrial customers. For the first time, this is a full-size Raspberry Pi computer using silicon built in-house at Raspberry Pi. The RP1 “southbridge” provides the bulk of the I/O capabilities for Raspberry Pi 5, and delivers a step change in peripheral performance and functionality. Aggregate USB bandwidth is more than doubled, yielding faster transfer speeds to external UAS drives and other high-speed peripherals; the dedicated two-lane 1Gbps MIPI camera and display interfaces present on earlier models have been replaced by a pair of four-lane 1.5Gbps MIPI transceivers, tripling total bandwidth, and supporting any combination of up to two cameras or displays; peak SD card performance is doubled, through support for the SDR104 high-speed mode; and for the first time the platform exposes a single-lane PCI Express 2.0 interface, providing support for high-bandwidth peripherals.",
        price: 179.99,
        stock_quantity: 9
    },
    { 
        name: "USB-C AC Power Adapter w/ On/Off Switch",
        description: "USB-C 5V/3A UL Power Adapter with ON/OFF Switch for Raspberry Pi 4. Every Raspberry PI Computer needs a power source, and this is a great one at a great price. Designed and tested to be FCC and UL approved. This compact external AC Power Adapter with USB-C™ plug is power efficient (DoE Level VI rated) and offers both Over Voltage Protection and Short Circuit Protection to provide reliable long time operation so you can enjoy more PI time. Compatible with Raspberry Pi 4 Model B and other SBCs with USB-C™ Connector.",
        price: 14.99,
        stock_quantity: 23
    },
    { 
        name: "Aluminum Heat Sink Kit",
        description: "The 3 Piece Aluminum Heat Sink Cooler Kit for Your Raspberry Pi. Is Your Pi Running Too Hot? Keep your Raspberry Pi running cool with this 3 Piece High Quality Heatsink Kit, even when you run it at 100% duty cycles. The Three included Heatsinks help keep your Pi from overheating without any fan noise. For use with the following Raspberry Pi Computers: Pi 4 Model B, Pi 3 Model B, Pi 2 Model B, Pi Model B+.",
        price: 6.99,
        stock_quantity: 15
    },
    { 
        name: "Raspberry Pi Keyboard and Hub",
        description: "The official Raspberry Pi keyboard includes three USB ports for connecting external devices. The keyboard includes three host USB ports for connecting external devices, such as USB mice, USB drives, and other USB-controlled devices. The product’s micro USB port is for connection to the Raspberry Pi. Via the USB hub built into the keyboard, the Raspberry Pi controls, and provides power to, the three USB Type A ports.",
        price: 49.99,
        stock_quantity: 40
    },
    { 
        name: "Seeed Studio ODYSSEY X86J4125",
        description: "Edge Computing devices are playing an increasingly important role in the field of IoT. Nowadays, a computer is not just a big rectangular black box under the desk, or a small portable device working on your knees. Computers are ubiquitous devices that span calculating, communicating, and data storage. Based on this definition, here we would like to introduce our new product – the ODYSSEY - X86J4125. ODYSSEY is a series of SBC (Single Board Computer), allowing you to build Edge Computing applications with ease. The ODYSSEY - X86J4125,  based on Intel Celeron J4125, is a Quad-Core 2.0GHz CPU that bursts up to 2.7GHz. It includes all the powerful features of Mini PC such as including an 8GB LPDDR4 RAM, 64GB eMMC Storage(optional), onboard Wi-Fi/BLE, Dual Gigabyte Ethernet Ports, Audio Input and Output, USB Ports, HDMI, SATA Connectors and PCIe, however, within a cost-effective price. With simple connections to Mouse, Keyboard and Monitor to ODYSSEY - X86J4125, you will get a Desktop Mini PC right away. With eMMC versions, you even have the Windows 10 Enterprise pre-installed! Just simply connect to a mouse, a keyboard and a monitor with the ODYSSEY – X86J4125, you will get a powerful Desktop Mini PC that can run Windows and Linux OS.",
        price: 300.00,
        stock_quantity: 2
    },
    { 
        name: "Titan Case for LattePanda 3 Delta",
        description: "The titan case features a sci-fi design, offers protection for components, is easy to assemble, and provides access to all ports of LattePanda 3 Delta. Titan case uses conflict aesthetics to combine functional design considerations with sci-fi elements. Understated color selection and layered surface treatment technology create a kind of design, flat but with unlimited potential. High-strength engineering plastic effectively protects the internal precise electronic components from accidental falls and static damage in a complex development environment.",
        price: 24.99,
        stock_quantity: 4
    }
]

products.each do |product|
  Product.create!(product)
end