; ModuleID = 'lowercase.c'
source_filename = "lowercase.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticData = internal global [16 x i16] [i16 72, i16 69, i16 76, i16 76, i16 79, i16 32, i16 87, i16 79, i16 82, i16 76, i16 68, i16 33, i16 72, i16 69, i16 76, i16 76], align 16
@.str = private unnamed_addr constant [29 x i8] c"iterations (%ld characters)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store i64 0, ptr %6, align 8
  br label %7

7:                                                ; preds = %12, %2
  %8 = load i64, ptr %6, align 8
  %9 = icmp ult i64 %8, 32
  br i1 %9, label %10, label %15

10:                                               ; preds = %7
  %11 = load i64, ptr %6, align 8
  call void @doTest(i64 noundef %11)
  br label %12

12:                                               ; preds = %10
  %13 = load i64, ptr %6, align 8
  %14 = add i64 %13, 1
  store i64 %14, ptr %6, align 8
  br label %7, !llvm.loop !6

15:                                               ; preds = %7
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal void @doTest(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  store i64 %0, ptr %2, align 8
  %8 = load i64, ptr %2, align 8
  store i64 %8, ptr %3, align 8
  %9 = load i64, ptr %3, align 8
  %10 = add i64 %9, 16
  %11 = sub i64 %10, 1
  %12 = udiv i64 %11, 16
  %13 = mul i64 %12, 16
  store i64 %13, ptr %4, align 8
  %14 = load i64, ptr %4, align 8
  %15 = mul i64 2, %14
  %16 = call ptr @malloc(i64 noundef %15) #5
  store ptr %16, ptr %5, align 8
  store i64 0, ptr %6, align 8
  br label %17

17:                                               ; preds = %25, %1
  %18 = load i64, ptr %6, align 8
  %19 = load i64, ptr %4, align 8
  %20 = icmp ult i64 %18, %19
  br i1 %20, label %21, label %28

21:                                               ; preds = %17
  %22 = load ptr, ptr %5, align 8
  %23 = load i64, ptr %6, align 8
  %24 = getelementptr inbounds i16, ptr %22, i64 %23
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %24, ptr align 16 @staticData, i64 32, i1 false)
  br label %25

25:                                               ; preds = %21
  %26 = load i64, ptr %6, align 8
  %27 = add i64 %26, 16
  store i64 %27, ptr %6, align 8
  br label %17, !llvm.loop !8

28:                                               ; preds = %17
  %29 = load i64, ptr %4, align 8
  %30 = mul i64 2, %29
  %31 = call ptr @malloc(i64 noundef %30) #5
  store ptr %31, ptr %7, align 8
  %32 = load i64, ptr %2, align 8
  %33 = load i64, ptr %3, align 8
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str, i64 noundef %32, i64 noundef %33)
  %35 = load ptr, ptr %7, align 8
  %36 = load i64, ptr %4, align 8
  %37 = mul i64 2, %36
  call void @llvm.memset.p0.i64(ptr align 2 %35, i8 0, i64 %37, i1 false)
  store i64 0, ptr %6, align 8
  br label %38

38:                                               ; preds = %46, %28
  %39 = load i64, ptr %6, align 8
  %40 = icmp ult i64 %39, 10000000
  br i1 %40, label %41, label %49

41:                                               ; preds = %38
  %42 = load ptr, ptr %5, align 8
  %43 = load i64, ptr %3, align 8
  %44 = load ptr, ptr %7, align 8
  %45 = call i64 @lower_StringImpl(ptr noundef %42, i64 noundef %43, ptr noundef %44)
  br label %46

46:                                               ; preds = %41
  %47 = load i64, ptr %6, align 8
  %48 = add i64 %47, 1
  store i64 %48, ptr %6, align 8
  br label %38, !llvm.loop !9

49:                                               ; preds = %38
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
define internal i64 @lower_StringImpl(ptr noalias noundef %0, i64 noundef %1, ptr noalias noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i16, align 2
  %9 = alloca i64, align 8
  %10 = alloca i16, align 2
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store i16 0, ptr %8, align 2
  store i64 0, ptr %9, align 8
  br label %11

11:                                               ; preds = %31, %3
  %12 = load i64, ptr %9, align 8
  %13 = load i64, ptr %6, align 8
  %14 = icmp ult i64 %12, %13
  br i1 %14, label %15, label %34

15:                                               ; preds = %11
  %16 = load ptr, ptr %5, align 8
  %17 = load i64, ptr %9, align 8
  %18 = getelementptr inbounds i16, ptr %16, i64 %17
  %19 = load i16, ptr %18, align 2
  store i16 %19, ptr %10, align 2
  %20 = load i16, ptr %10, align 2
  %21 = zext i16 %20 to i32
  %22 = load i16, ptr %8, align 2
  %23 = zext i16 %22 to i32
  %24 = or i32 %23, %21
  %25 = trunc i32 %24 to i16
  store i16 %25, ptr %8, align 2
  %26 = load i16, ptr %10, align 2
  %27 = call zeroext i16 @toASCIILower(i16 noundef zeroext %26)
  %28 = load ptr, ptr %7, align 8
  %29 = load i64, ptr %9, align 8
  %30 = getelementptr inbounds i16, ptr %28, i64 %29
  store i16 %27, ptr %30, align 2
  br label %31

31:                                               ; preds = %15
  %32 = load i64, ptr %9, align 8
  %33 = add i64 %32, 1
  store i64 %33, ptr %9, align 8
  br label %11, !llvm.loop !10

34:                                               ; preds = %11
  %35 = load i16, ptr %8, align 2
  %36 = zext i16 %35 to i32
  %37 = and i32 %36, -128
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %40, label %39

39:                                               ; preds = %34
  store i64 1, ptr %4, align 8
  br label %41

40:                                               ; preds = %34
  store i64 0, ptr %4, align 8
  br label %41

41:                                               ; preds = %40, %39
  %42 = load i64, ptr %4, align 8
  ret i64 %42
}

; Function Attrs: noinline nounwind uwtable
define internal zeroext i16 @toASCIILower(i16 noundef zeroext %0) #0 {
  %2 = alloca i16, align 2
  store i16 %0, ptr %2, align 2
  %3 = load i16, ptr %2, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16, ptr %2, align 2
  %6 = zext i16 %5 to i32
  %7 = icmp sge i32 %6, 65
  br i1 %7, label %8, label %12

8:                                                ; preds = %1
  %9 = load i16, ptr %2, align 2
  %10 = zext i16 %9 to i32
  %11 = icmp sle i32 %10, 90
  br label %12

12:                                               ; preds = %8, %1
  %13 = phi i1 [ false, %1 ], [ %11, %8 ]
  %14 = zext i1 %13 to i32
  %15 = shl i32 %14, 5
  %16 = or i32 %4, %15
  %17 = trunc i32 %16 to i16
  ret i16 %17
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { allocsize(0) }

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
!10 = distinct !{!10, !7}
