X = 2
profileSize = X * 0x40000000
fbReservation = 0x8000000 + (profileSize - 0x40000000) // 0x10
framebuffer = profileSize - fbReservation

print(f'profileSize: {hex(profileSize)}')
print(f'fbReservation: {hex(fbReservation)}')
print(f'framebuffer: {hex(framebuffer)}')
