; ModuleID = 'lowercase_unoptimized.ll'
source_filename = "lowercase.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@0 = internal global [16 x i16] [i16 72, i16 69, i16 76, i16 76, i16 79, i16 32, i16 87, i16 79, i16 82, i16 76, i16 68, i16 33, i16 72, i16 69, i16 76, i16 76], align 16
@1 = private unnamed_addr constant [29 x i8] c"iterations (%ld characters)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %2
  br label %4

4:                                                ; preds = %3
  call void @2(i64 noundef 0)
  br label %5

5:                                                ; preds = %4
  call void @2(i64 noundef 1)
  br label %6

6:                                                ; preds = %5
  call void @2(i64 noundef 2)
  br label %7

7:                                                ; preds = %6
  call void @2(i64 noundef 3)
  br label %8

8:                                                ; preds = %7
  call void @2(i64 noundef 4)
  br label %9

9:                                                ; preds = %8
  call void @2(i64 noundef 5)
  br label %10

10:                                               ; preds = %9
  call void @2(i64 noundef 6)
  br label %11

11:                                               ; preds = %10
  call void @2(i64 noundef 7)
  br label %12

12:                                               ; preds = %11
  call void @2(i64 noundef 8)
  br label %13

13:                                               ; preds = %12
  call void @2(i64 noundef 9)
  br label %14

14:                                               ; preds = %13
  call void @2(i64 noundef 10)
  br label %15

15:                                               ; preds = %14
  call void @2(i64 noundef 11)
  br label %16

16:                                               ; preds = %15
  call void @2(i64 noundef 12)
  br label %17

17:                                               ; preds = %16
  call void @2(i64 noundef 13)
  br label %18

18:                                               ; preds = %17
  call void @2(i64 noundef 14)
  br label %19

19:                                               ; preds = %18
  call void @2(i64 noundef 15)
  br label %20

20:                                               ; preds = %19
  call void @2(i64 noundef 16)
  br label %21

21:                                               ; preds = %20
  call void @2(i64 noundef 17)
  br label %22

22:                                               ; preds = %21
  call void @2(i64 noundef 18)
  br label %23

23:                                               ; preds = %22
  call void @2(i64 noundef 19)
  br label %24

24:                                               ; preds = %23
  call void @2(i64 noundef 20)
  br label %25

25:                                               ; preds = %24
  call void @2(i64 noundef 21)
  br label %26

26:                                               ; preds = %25
  call void @2(i64 noundef 22)
  br label %27

27:                                               ; preds = %26
  call void @2(i64 noundef 23)
  br label %28

28:                                               ; preds = %27
  call void @2(i64 noundef 24)
  br label %29

29:                                               ; preds = %28
  call void @2(i64 noundef 25)
  br label %30

30:                                               ; preds = %29
  call void @2(i64 noundef 26)
  br label %31

31:                                               ; preds = %30
  call void @2(i64 noundef 27)
  br label %32

32:                                               ; preds = %31
  call void @2(i64 noundef 28)
  br label %33

33:                                               ; preds = %32
  call void @2(i64 noundef 29)
  br label %34

34:                                               ; preds = %33
  call void @2(i64 noundef 30)
  br label %35

35:                                               ; preds = %34
  call void @2(i64 noundef 31)
  br i1 false, label %36, label %37

36:                                               ; preds = %35
  call void @2(i64 noundef 32)
  unreachable

37:                                               ; preds = %35
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal void @2(i64 noundef %0) #0 {
  %2 = add i64 %0, 15
  %3 = and i64 %2, -16
  %4 = shl i64 %3, 1
  %5 = call ptr @malloc(i64 noundef %4) #5
  br label %6

6:                                                ; preds = %8, %1
  %.0 = phi i64 [ 0, %1 ], [ %10, %8 ]
  %7 = icmp ult i64 %.0, %3
  br i1 %7, label %8, label %11

8:                                                ; preds = %6
  %9 = getelementptr inbounds i16, ptr %5, i64 %.0
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 2 dereferenceable(32) %9, ptr noundef nonnull align 16 dereferenceable(32) @0, i64 32, i1 false)
  %10 = add i64 %.0, 16
  br label %6, !llvm.loop !6

11:                                               ; preds = %6
  %12 = call ptr @malloc(i64 noundef %4) #5
  %13 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @1, i64 noundef %0, i64 noundef %0) #6
  call void @llvm.memset.p0.i64(ptr align 2 %12, i8 0, i64 %4, i1 false)
  br label %14

14:                                               ; preds = %16, %11
  %.1 = phi i64 [ 0, %11 ], [ %18, %16 ]
  %15 = icmp ult i64 %.1, 10000000
  br i1 %15, label %16, label %19

16:                                               ; preds = %14
  %17 = call i64 @3(ptr noundef %5, i64 noundef %0, ptr noundef %12)
  %18 = add i64 %.1, 1
  br label %14, !llvm.loop !8

19:                                               ; preds = %14
  ret void
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define internal i64 @3(ptr noalias noundef %0, i64 noundef %1, ptr noalias noundef %2) #0 {
  br label %4

4:                                                ; preds = %6, %3
  %.02 = phi i16 [ 0, %3 ], [ %11, %6 ]
  %.01 = phi i64 [ 0, %3 ], [ %12, %6 ]
  %5 = icmp ult i64 %.01, %1
  br i1 %5, label %6, label %13

6:                                                ; preds = %4
  %7 = getelementptr inbounds i16, ptr %0, i64 %.01
  %8 = load i16, ptr %7, align 2
  %9 = call zeroext i16 @4(i16 noundef zeroext %8)
  %10 = getelementptr inbounds i16, ptr %2, i64 %.01
  store i16 %9, ptr %10, align 2
  %11 = or i16 %8, %.02
  %12 = add i64 %.01, 1
  br label %4, !llvm.loop !9

13:                                               ; preds = %4
  %.02.lcssa = phi i16 [ %.02, %4 ]
  %.not = icmp ult i16 %.02.lcssa, 128
  br i1 %.not, label %14, label %15

14:                                               ; preds = %13
  br label %16

15:                                               ; preds = %13
  br label %16

16:                                               ; preds = %15, %14
  %.0 = phi i64 [ 0, %15 ], [ 1, %14 ]
  ret i64 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal zeroext i16 @4(i16 noundef zeroext %0) #0 {
  %2 = icmp ugt i16 %0, 64
  br i1 %2, label %3, label %6

3:                                                ; preds = %1
  %4 = icmp ult i16 %0, 91
  %5 = select i1 %4, i16 32, i16 0
  br label %6

6:                                                ; preds = %3, %1
  %7 = phi i16 [ 0, %1 ], [ %5, %3 ]
  %8 = or i16 %7, %0
  ret i16 %8
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind allocsize(0) }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
